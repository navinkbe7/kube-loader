# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=scape-goat
BINARY_UNIX=$(BINARY_NAME)_unix

all: test build

build:
				$(GOBUILD) -o $(BINARY_NAME) -v
test:
				$(GOTEST) -v ./...
clean:
				$(GOCLEAN)
				rm -f $(BINARY_NAME)
				rm -f $(BINARY_UNIX)
run:
				$(GOBUILD) -o $(BINARY_NAME) -v ./...
				./$(BINARY_NAME)
deps:
				$(GOGET) github.com/markbates/goth
				$(GOGET) github.com/markbates/pop


# Cross compilation
build-linux:
				CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v
docker-build:
				docker build -t navinkbe7/$(BINARY_NAME) .
docker-push:
				docker tag navinkbe7/$(BINARY_NAME):latest navinkbe7/$(BINARY_NAME):v0.0.1
				docker push navinkbe7/$(BINARY_NAME):v0.0.1
docker-run:
				docker run --rm -it -p 8080:8080 \
				-e MY_RESPONSE=container1 \
				navinkbe7/$(BINARY_NAME):latest