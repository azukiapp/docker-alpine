#!/usr/bin/env bats

load ./test_helper

@test "version is correct" {
  run docker run "azukiapp/alpine:3.2" cat /etc/os-release
  [ $status -eq 0 ]
  [ "${lines[2]}" = "VERSION_ID=3.2.0" ]
}

@test "package installs cleanly" {
  run docker run "azukiapp/alpine:3.2" apk add --update openssl
  [ $status -eq 0 ]
}

@test "timezone" {
  run docker run "azukiapp/alpine:3.2" date +%Z
  [ $status -eq 0 ]
  [ "$output" = "UTC" ]
}

@test "apk-install script should be missing" {
  run docker run "azukiapp/alpine:3.2" which apk-install
  [ $status -eq 1 ]
}

@test "repository list is correct" {
  run docker run "azukiapp/alpine:3.2" cat /etc/apk/repositories
  [ $status -eq 0 ]
  assert_match  "${msg_not_found}"

  assert_match "http://dl-4.alpinelinux.org/alpine/v3.2/main/"
  assert_match "@edge http://nl.alpinelinux.org/alpine/edge/main/"
  assert_match "@testing http://nl.alpinelinux.org/alpine/edge/testing/"
}

@test "cache is empty" {
  run docker run "azukiapp/alpine:3.2" sh -c "ls -1 /var/cache/apk | wc -l"
  [ $status -eq 0 ]
  [ "$output" = "0" ]
}
