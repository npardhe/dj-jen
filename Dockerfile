FROM python:alpine AS builder
WORKDIR /app
RUN pip install django==4.1.2
COPY . .

EXPOSE 8000
RUN python manage.py migrate

FROM alpine
WORKDIR /app
COPY --from=builder /app/ /app/
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
