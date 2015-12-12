#!/usr/bin/env bats

load ./test_helper

image_name="azukiapp/alpine"
 image_tag="3.2"
image="${image_name}:${image_tag}"

@test "version is correct" {
  run ${DOCKER} run ${image} cat /etc/os-release
  assert_success
  assert_match "VERSION_ID=3.2"
}

@test "package installs cleanly" {
  run ${DOCKER} run ${image} apk add --update openssl
  assert_success
}

@test "timezone" {
  run ${DOCKER} run ${image} date +%Z
  assert_success
  assert_match "^UTC"
}

@test "apk-install script should be missing" {
  run ${DOCKER} run ${image} which apk-install
  [ $status -eq 1 ]
}

@test "repository list is correct" {
  run ${DOCKER} run ${image} cat /etc/apk/repositories
  assert_success
  assert_match  "${msg_not_found}"

  assert_match "http://dl-4.alpinelinux.org/alpine/v3.2/main/"
  assert_match "@edge http://nl.alpinelinux.org/alpine/edge/main/"
  assert_match "@testing http://nl.alpinelinux.org/alpine/edge/testing/"
}

@test "cache is empty" {
  run ${DOCKER} run ${image} sh -c "ls -1 /var/cache/apk | wc -l"
  assert_success
  assert_match "^0$"
}
