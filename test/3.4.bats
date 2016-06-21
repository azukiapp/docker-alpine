#!/usr/bin/env bats

load ./test_helper

image_name="azukiapp/alpine"
 image_tag="3.4"
image="${image_name}:${image_tag}"

@test "version is correct" {
  run ${DOCKER} run ${image} cat /etc/os-release
  assert_success
  assert_match "VERSION_ID=3.4"
}

@test "package installs cleanly" {
  run ${DOCKER} run ${image} apk add --update openssl
  assert_success
}

@test "timezone" {
  run ${DOCKER} run ${image} date +%Z
  assert_success
  [ "${lines[@]: -1}" = "UTC" ]
}

@test "apk-install script should be missing" {
  run ${DOCKER} run ${image} which apk-install
  [ $status -eq 1 ]
}

@test "repository list is correct" {
  run ${DOCKER} run ${image} cat /etc/apk/repositories
  assert_success

  assert_match "http://dl-cdn.alpinelinux.org/alpine/v3.4/main"
  assert_match "http://dl-cdn.alpinelinux.org/alpine/v3.4/community"
}

@test "cache is empty" {
  run ${DOCKER} run ${image} sh -c "ls -1 /var/cache/apk | wc -l"
  assert_success
  [ "${lines[@]: -1}" = "0" ]
}
