from flask import Flask
from os import environ

app = Flask(__name__)


@app.route("/app2")
def hello_world():
    msg = "no secrets"
    if "SECRET" in environ:
        msg = environ["SECRET"]

    return f"app2: {msg}"


if __name__ == "__main__":
    app.run(port=5001)
