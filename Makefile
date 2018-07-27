DOCKER_CMD = docker run --rm -v $(PWD):/go/src/app -w /go/src/app golang
all: build run

run:
	@echo "-- running app --"
	docker run --rm -p 8080:8080 edast/nta

build:
	@echo "-- building app --"
	docker build -t edast/nta .

deps:
	@echo "-- getting dependencies --"
	docker build --target dependencies -t edast/nta .

clean:
	@echo "-- removing app binary --"
	rm -fr app vendor
