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

CMD ["go", "run", "cmd/server/main.go"]
