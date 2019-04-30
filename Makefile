LDFLAGS=-ldflags="-s -w"
OUT=bin
BUILD=go build
NAME=gminer

all: linux64 windows64 macos64 linux32 macos32 windows32 linux_arm linux_arm64

linux64:
	$(eval export GOOS=linux)
	$(eval export GOARCH=amd64)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}

linux32:
	$(eval export GOOS=linux)
	$(eval export GOARCH=386)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}

linux_arm64:
	$(eval export GOOS=linux)
	$(eval export GOARCH=arm64)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}

linux_arm:
	$(eval export GOOS=linux)
	$(eval export GOARCH=arm)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}

windows64:
	$(eval export GOOS=windows)
	$(eval export GOARCH=amd64)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}.exe

windows32:
	$(eval export GOOS=windows)
	$(eval export GOARCH=386)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}.exe

macos64:
	$(eval export GOOS=darwin)
	$(eval export GOARCH=amd64)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}

macos32:
	$(eval export GOOS=darwin)
	$(eval export GOARCH=386)
	${BUILD} ${LDFLAGS} -o ${OUT}/${GOOS}/${NAME}_${GOARCH}

.PHONY: linux64 windows64 macos64 linux32 macos32 windows32 linux_arm linux_arm64
