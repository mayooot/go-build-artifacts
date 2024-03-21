GOARCH = amd64
BUILD_DIR ?= ./foo
GO_FILE ?= ./main.go
BINARY ?= foo

build: linux darwin windows

linux:
	cd ${BUILD_DIR}; \
	GOOS=linux GOARCH=${GOARCH} go build -o ${BINARY}-linux-${GOARCH} ${GO_FILE}; \
	cd - >/dev/null

darwin:
	cd ${BUILD_DIR}; \
	GOOS=darwin GOARCH=${GOARCH} go build -o ${BINARY}-darwin-${GOARCH} ${GO_FILE}; \
	cd - >/dev/null

windows:
	cd ${BUILD_DIR}; \
	GOOS=windows GOARCH=${GOARCH} go build -o ${BINARY}-windows-${GOARCH}.exe ${GO_FILE}; \
	cd - >/dev/null

.PHONY: build linux darwin windows