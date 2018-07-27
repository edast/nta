
all: build run

run:
	@echo "-- running app --"
	./app

build:
	@echo "-- building app --"
	dep ensure
	go build -o app main.go

clean:
	@echo "-- removing app binary --"
	rm -f app
