all:
	docker build -t azukiapp/alpine 3.2
	docker build -t azukiapp/alpine:3.2 3.2

no-cache:
	docker build --rm --no-cache -t azukiapp/alpine 3.2
	docker build --rm --no-cache -t azukiapp/alpine 3.2

bats:
	declare -a test_files
	build_files=( `echo $(find ./test -name '*.bats' -type f -print0)` )
	bats "${test_files[@]}"

test: all bats
	# Restart and run a tests
	# azk shell alpine -c "test"

.PHONY: bats test no-cache all
