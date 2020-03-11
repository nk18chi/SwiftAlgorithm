#!/bin/bash
swiftc -O /Users/naoki/development/ciccc/Swift/SwiftAlgorithm/SwiftAlgorithm/Greedy/MinimumCostFlow.swift
for i in {1..50}
do
  if [ $i -lt 10 ]; then
    echo "mcf.0$i"
    diff /Users/naoki/Desktop/mcf/mcf.0$i.out <(./MinimumCostFlow </Users/naoki/Desktop/mcf/mcf.0$i.in)
  else
    echo "mcf.$i"
    diff /Users/naoki/Desktop/mcf/mcf.$i.out <(./MinimumCostFlow </Users/naoki/Desktop/mcf/mcf.$i.in)
  fi
done
