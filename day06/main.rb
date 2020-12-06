#!/usr/bin/env ruby

input = $<.read.split("\n\n")

part1, part2 = 0, 0

input.map do |answers|
  num_responses = answers.split(/\n/).size
  set = answers.gsub(/\n/, "")
    .chars
    .group_by(&:itself)
    .transform_values(&:size)
  part1 += set.keys.size
  part2 += set.values.count { |n| n == num_responses }
end

puts "Part 1: #{ part1 }"
puts "Part 2: #{ part2 }"

