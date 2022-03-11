from flask import Flask

app=Flask(__name__)

@app.route('/')

def ret():

    return 'pass'



app.run(host='0.0.0.0',port=6789)