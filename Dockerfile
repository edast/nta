FROM golang:1.10 as godep
RUN curl -fsSL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 && \
    chmod +x /usr/local/bin/dep

FROM godep as dependencies
ARG GOREPO=/go/src/github.com/edast/nta
RUN mkdir -p ${GOREPO}
WORKDIR ${GOREPO}
ADD . ${GOREPO}/
RUN dep ensure -vendor-only

FROM dependencies as builder
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -i -o app main.go

FROM scratch
ARG GOREPO=/go/src/github.com/edast/nta
WORKDIR /root/
COPY --from=builder ${GOREPO}/app ./
CMD ["./app"]