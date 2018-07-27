
all: run

run:
	@echo "-- running app --"
	./app

build:
	@echo "-- building app --"
	go build -o app main.go

clean:
	@echo "-- removing app binary --"
	rm -f app
