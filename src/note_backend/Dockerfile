FROM python:3.11-slim-bookworm

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir --upgrade \
    "setuptools>=82.0.0" \
    "wheel>=0.46.2" \
    && python -m pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]