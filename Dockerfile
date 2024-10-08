FROM python:3.8-slim-buster
RUN mkdir /pdf && chmod 777 /pdf

WORKDIR /pdf

COPY dockerImage.txt dockerImage.txt
RUN pip install --upgrade pip && pip install -r dockerImage.txt 

RUN apt update && apt install -y ocrmypdf
RUN apt install -y wkhtmltopdf

COPY . .

CMD flask run -h 0.0.0.0 -p 8000 & python3 pdf.py
