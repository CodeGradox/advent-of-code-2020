#!/usr/bin/env ruby

part1_count = 0
part2_count = 0

$<.read.lines.map(&:chomp).each do |line|
  _, min, max, char, password = line.match(/\A(\d+)\-(\d+)\s+(\w):\s+(.*)\z/).to_a
  min, max = [min, max].map(&:to_i)

  part1_count += 1 if password.count(char).between?(min, max)

  # Use XOR to check if exactly ONE character match.
  part2_count += 1 if (password[min - 1] == char) ^ (password[max - 1] == char)
end

puts "Part 1: #{ part1_count }"
puts "Part 2: #{ part2_count }"
