#!/usr/bin/env ruby

input = $<.read.split("\n\n")

part1 = input.select do |line|
  line.match?(/hcl:/) &&
  line.match?(/pid:/) &&
  line.match?(/ecl:/) &&
  line.match?(/byr:/) &&
  line.match?(/iyr:/) &&
  line.match?(/eyr:/) &&
  line.match?(/hgt:/)
end.count

puts "Part 1: #{ part1 }"

part2 = input.sum do |line|
    line.match?(/hcl:#[0-9a-f]{6}\b/) &&
    line.match?(/pid:\d{9}\b/) &&
    line.match?(/ecl:(amb|blu|brn|gry|grn|hzl|oth)\b/) &&
    line.match?(/byr:(19[2-9]\d)|(200[012])\b/) &&
    line.match?(/iyr:((201\d)|(2020))\b/) &&
    line.match?(/eyr:((202\d)|(2030))\b/) &&
    line.match?(/hgt:(((1[5-8]\d|19[0-3])cm)|((59|6\d|7[0-6])in))\b/) ? 1 : 0
end

puts "Part 2: #{ part2 }"
