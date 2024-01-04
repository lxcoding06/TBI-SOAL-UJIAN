import nltk
from flask import Flask, render_template, request
import mysql.connector
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory

nltk.download('punkt')
nltk.download('stopwords')

app = Flask(__name__)

# Konfigurasi Database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="tbi"
)
cursor = db.cursor()

# Fungsi untuk melakukan text-processing
def preprocess_text(text):
    tokens = word_tokenize(text.lower())
    stop_words = set(stopwords.words('indonesian'))
    tokens = [token for token in tokens if token.isalnum() and token not in stop_words]
    stemmer = StemmerFactory().create_stemmer()
    tokens = [stemmer.stem(token) for token in tokens]
    return ' '.join(tokens)

# Fungsi untuk menghitung TF-IDF menggunakan VSM
def calculate_tfidf(data):
    vectorizer = TfidfVectorizer()
    tfidf_matrix = vectorizer.fit_transform(data)
    return tfidf_matrix

# Route untuk halaman utama
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        keyword = request.form['keyword']

        # Query untuk mengambil data dari database
        query = "SELECT * FROM data"
        cursor.execute(query)
        raw_data = cursor.fetchall()

        # Text-processing dan pembobotan dengan TF-IDF
        processed_data = [preprocess_text(row[1]) for row in raw_data]
        processed_query = preprocess_text(keyword)
        processed_data.append(processed_query)

        tfidf_matrix = calculate_tfidf(processed_data)
        cosine_similarities = linear_kernel(tfidf_matrix[-1], tfidf_matrix[:-1]).flatten()

        # Ambil data yang relevan
        relevant_data_indices = cosine_similarities.argsort()[:-6:-1]  # Ambil 5 data teratas
        relevant_data = [raw_data[i] for i in relevant_data_indices if cosine_similarities[i] > 0]

        if not relevant_data:
            # Tidak ada data yang relevan
            return render_template('index.html', data=None, keyword=keyword, message="Maaf, data yang Anda cari tidak ada.")
        else:
            # Render template HTML dan kirimkan data ke dalam template
            return render_template('index.html', data=relevant_data, keyword=keyword, message=None)
    else:
        return render_template('index.html', data=None, keyword=None, message=None)

if __name__ == '__main__':
    app.run(debug=True)
