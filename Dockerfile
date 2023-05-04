FROM golang:alpine
WORKDIR /app
RUN apk add --no-cache git gcc musl-dev mupdf mupdf-dev
ARG GCP_KEY=$_GCP_KEY_CB
COPY go.mod go.sum ./
COPY main.go ./
RUN go mod download
RUN go build -tags extlib -o /main
CMD [ "/main" ]
