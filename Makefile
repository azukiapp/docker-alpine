all:
	docker build -t azukiapp/alpine 3.2
	docker build -t azukiapp/alpine:3.2 3.2

no-cache:
	docker build --rm --no-cache -t azukiapp/alpine 3.2
	docker build --rm --no-cache -t azukiapp/alpine 3.2

# build_files=`find "$(shell pwd)/test" -name '*.bats' -type f -print0`
# @export TEST_FILES="$(shell echo `find "test" -name '*.bats' -type f -print0`)"
bats:
	bats $(shell echo `find "test" -name '*.bats' -type f -print0`)

test: all bats
	# Restart and run a tests
	# azk shell alpine -c "test"

.PHONY: bats test no-cache all
