FROM golang:1.21.5 AS builder
WORKDIR /app
COPY webapi/ .
RUN go build -o app .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8081
CMD ["./app"]