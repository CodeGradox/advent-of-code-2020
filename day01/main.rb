#!/usr/bin/env ruby

def product_of_combinations(list, n)
  list.combination(n).find { |a| a.sum == 2020 }&.reduce(&:*)
end

input = $<.read.lines.map(&:to_i)

puts "Part 1: #{ product_of_combinations(input, 2) }"
puts "Part 2: #{ product_of_combinations(input, 3) }"
