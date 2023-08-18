FROM node:18-slim as builder

WORKDIR /app

COPY app/package.json app/yarn.lock ./

RUN yarn install

COPY /app .

RUN yarn build

FROM golang:1.20-alpine as server

WORKDIR /usr/src/app

COPY server/go.mod server/go.sum ./

RUN go mod download

COPY /server .

COPY --from=builder /app/dist ./web

RUN go build -o /usr/bin/app cmd/server/main.go

FROM alpine:3 as production

COPY --from=server /usr/bin/app /usr/bin/app

COPY --from=builder /app/dist ./web

EXPOSE 8080

CMD ["/usr/bin/app"]
