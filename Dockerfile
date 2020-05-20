FROM golang:1.14.0-alpine as builder

ENV GO111MODULE=on

RUN apk update --no-cache && \
  apk add git make

WORKDIR /go/src/github.com/YumaUeno123/practice
COPY . .

RUN make install-tools

RUN go build -o main cmd/main.go

FROM alpine:3.10

RUN apk update && apk --no-cache add ca-certificates curl

RUN apk --no-cache add tzdata && \
  cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  apk del tzdata

WORKDIR /cmd
COPY --from=builder /go/src/github.com/YumaUeno123/practice/main .

CMD /cmd/main -port $PORT
