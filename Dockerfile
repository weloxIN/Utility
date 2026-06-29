# 1.BUILDING
FROM python:3.12-alpine AS Builder
RUN apk update && apk upgrade
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt


# 2. BOOTING
FROM python:3.12-alpine 
RUN apk update && apk upgrade
WORKDIR /app
COPY --from=Builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
CMD ["python3", "main.py"]
