#!/bin/bash

for i in "${@}"
do
`sed "/\$i/d" revoked.txt > revoked.new`
`mv revoked.new revoked.txt`
done
