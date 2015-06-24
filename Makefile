all:
	docker build -t azukiapp/alpine 3.2
	docker build -t azukiapp/alpine:3.2 3.2

no-cache:
	docker build --rm --no-cache -t azukiapp/alpine 3.2
	docker build --rm --no-cache -t azukiapp/alpine 3.2

TEST_FILES=$(shell find test -name '*.bats' -type f -print0 | xargs -0n1 | sort -u)

bats:
	bats $(TEST_FILES)

test: all bats
	# Restart and run a tests
	# azk shell alpine -c "test"

.PHONY: bats test no-cache all
