FROM golang:1.21.5
WORKDIR /app

COPY webapi/ .

RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping


EXPOSE 8081

CMD ["/docker-gs-ping"]