#!/bin/bash

for i in "${@}"
do
`sed "/\$i/d" missing.txt > missing.new`
`mv missing.new missing.txt`
done
