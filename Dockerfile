FROM golang:alpine as builder
WORKDIR /go/src/app
COPY hello.go .

RUN CGO_ENABLED=0 go build -o /app hello.go

FROM scratch
COPY --from=builder /app /app
ENTRYPOINT ["/app"]