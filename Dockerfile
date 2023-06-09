FROM golang:alpine
WORKDIR /app
RUN apk add --no-cache git gcc musl-dev mupdf mupdf-dev
ENV GCP_KEY=""
COPY go.mod go.sum ./
COPY main.go ./
RUN go mod download
RUN go get main
EXPOSE 80
RUN go build -tags extlib -o /main
CMD [ "/main" ]
