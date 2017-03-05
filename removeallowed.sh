#!/bin/bash

for i in "${@}"
do
`sed "/\$i/d" master.txt > master.new`
`mv master.new master.txt`
done

