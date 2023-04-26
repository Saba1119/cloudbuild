## We specify the base image we need for our
## go application
FROM public.ecr.aws/z0z2p3x2/saba1119/golang:1
## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app
## We copy everything in the root directory
## into our /app directory
COPY . /app
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app
## we run go build to compile the binary
## executable of our Go program
RUN yum update
RUN yum install git
RUN git --version
RUN go get cloud.google.com/go
RUN go build main.go 
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]
