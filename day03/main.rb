#!/usr/bin/env ruby

input = $<.lines.map(&:chomp)

def count_trees(lines, move, skip=1)
  pos = 0
  lines.each_slice(skip)
    .map(&:first)
    .reduce(0) do |acc, line|
      acc += 1 if line[pos] == "#"
      pos = (pos + move) % line.length
      acc
    end
end

result = [[1], [3], [5], [7], [1, 2]].map { |par| count_trees(input, *par) }
puts "Part 1", result[1]
puts "Part 1", result.reduce(&:*)
