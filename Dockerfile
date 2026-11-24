FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates tzdata && rm -rf /var/lib/apt/lists/*
ENV TZ=Asia/Jakarta

WORKDIR /app

COPY main-amd64 /app/main
COPY storage /app/storage
COPY .env /app/.env

RUN chmod +x /app/main

# Port sesuai SERVER_PORT di .env (default: 9988)
EXPOSE 9988

CMD ["/app/main"]
