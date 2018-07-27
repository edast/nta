DOCKER_CMD = docker run --rm -v $(PWD):/go/src/app -w /go/src/app golang
all: deps build run

run:
	@echo "-- running app --"
	./app

build:
	@echo "-- building app --"
	${DOCKER_CMD} go build -o app main.go

deps:
	@echo "-- getting dependencies --"
	${DOCKER_CMD} /bin/bash -c "go get -u github.com/golang/dep/cmd/dep && dep ensure -vendor-only"

clean:
	@echo "-- removing app binary --"
	rm -f app
