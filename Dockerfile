FROM alpine:3.13.5

RUN apk update && apk add --no-cache git make musl-dev go

# Configure Go
#ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
ENV GO_PROJECT golang.org/x/example/outyet

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

EXPOSE 8080

WORKDIR $GOPATH

# Install simple webapp
RUN go get -u $GO_PROJECT

RUN go build ${GOPATH}/src/${GO_PROJECT}/main.go

ENTRYPOINT [ "/go/bin/outyet" ]