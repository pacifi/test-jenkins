from flask import Flask
app = Flask(__name__)

def suma(a,b):
    return a+b

@app.route('/')
def hello_world():
    resultado = suma(3,2)
    return 'Hello World! %s' % resultado

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
