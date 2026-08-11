FROM python:3.11-slim

WORKDIR /app

COPY Day45/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY Day45/ .

EXPOSE 5000

CMD ["python", "app.py"]
