from flask import Flask
import time

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/wait1sec")
def hello1sec():
    time.sleep(1)
    return "1sec delayed"

@app.route("/wait2sec")
def hello2sec():
    time.sleep(2)
    return "2sec delayed"


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
