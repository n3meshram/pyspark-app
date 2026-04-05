FROM python:3.9-slim

WORKDIR /app

# Install Java (correct package)
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/default-java

# Install PySpark
RUN pip install pyspark

COPY app.py /app/

CMD ["python", "/app/app.py"]