from fastapi import FastAPI
from mangum import Mangum


app = FastAPI()

@app.get("/")
def main():
    return {"message": "Hello World"}


handler = Mangum(app)