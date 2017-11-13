from flask import Flask, render_template
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'nationalid'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/")
def index():
  # conn = mysql.connect()
  # cursor = conn.cursor()
  # cursor.execute("SELECT * from User")
  # data = cursor.fetchone()
  return render_template("index.html")

@app.route("/about")
def about():
  return render_template("about.html")

@app.route("/home_page")
def home_page():
  return render_template("home_page.html")

if __name__ == "__main__":
  app.run(debug=True)