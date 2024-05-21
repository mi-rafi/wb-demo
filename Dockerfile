FROM golang:1.22 AS builder
WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN GOOS=linux CGO_ENABLED=0 go build -installsuffix cgo -o app ./cmd/demo

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=0 /app .
CMD mkdir /var/data
ENV LOG_FMT console
ENV LISTEN 0.0.0.0:9000
ENTRYPOINT ["/app/app"]