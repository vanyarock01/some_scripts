#!/bin/bash

test_run_cmd="./test_run"
test_path="test/validation_test.py"
if [ $# -eq 1 ]; then
    retry_num=$1
else
    retry_num=10
fi

err_num=0
for i in $(seq 1 $retry_num); do
    eval "$test_run_cmd $test_path" >> /dev/null
    if [ $? -ne 0 ]; then ((err_num++)); fi
    echo -ne "retry number: $i, error number: $err_num\r"
done
echo
