# helpers to run bats

 __FILE__="${BASH_SOURCE[0]}"
TESTS_DIR=$( cd "$( dirname "${__FILE__}" )" && pwd )

DOCKER=$(which adocker || which "docker")

load $TESTS_DIR/support/assertions.bash
load $TESTS_DIR/support/commons.bash

# Label to use in test
# test_folder=`cd \`dirname $(readlink ${__FILE__} || echo ${__FILE__} )\`; pwd`
# test_folder=$(echo $test_folder | sed 's/\//\\\//g')
# test_folder=$(echo "$(dirname "${BATS_TEST_FILENAME}")" | sed 's/'"${test_folder}"'//g')
# export test_label="${test_folder}/$(basename -s .bats "${BATS_TEST_FILENAME}"):"

# Global tests setup and teardown
# teardown() {
#   # teardown task
#   echo "nothing";
# }
