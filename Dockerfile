FROM python:3.8
WORKDIR /app
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000

ENV FLASK_ENV "production"
ENV FLASK_DEBUG False
ENV FLASK_APP "webview.py"
ENV MNEMONIC "paste your seed here"

CMD ["gunicorn"  , "-b", "0.0.0.0:5000", "webview:app"]

