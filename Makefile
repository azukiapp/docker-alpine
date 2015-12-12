ROOT_PATH := $(shell pwd)
DEPS_PATH := ${ROOT_PATH}/deps
BATS_VERSION := "master"
IMAGE_NAME := "azukiapp/alpine"


# bins
DOCKER := $(shell which adocker || which docker)
BATS := ${DEPS_PATH}/bin/bats

all: build test

build:
	${DOCKER} build -t ${IMAGE_NAME} 3.2
	${DOCKER} build -t ${IMAGE_NAME}:3.2 3.2

build-no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME} 3.2
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:3.2 3.2

test: bats

.PHONY: all prepare build test


TEST_FILES=$(shell find test -name '*.bats' -type f -print0 | xargs -0n1 | sort -u)
bats: ${DEPS_PATH}/bats
	${BATS} --pretty $(TEST_FILES)

${DEPS_PATH}/bats:
	@mkdir -p ${DEPS_PATH}/bin
	@git clone -b ${BATS_VERSION} https://github.com/sstephenson/bats ${DEPS_PATH}/bats
	@ln -s ${DEPS_PATH}/bats/bin/bats ${DEPS_PATH}/bin/

.PHONY: bats
