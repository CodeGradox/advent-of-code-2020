#!/usr/bin/env ruby

def partition(word, lower, upper, char)
  word.chars.reduce([lower, upper]) do |acc, c|
    n = acc.sum / 2
    if c == char
      acc[0] = n+1
    else
      acc[1] = n
    end
    acc
  end.first
end

def solve(word)
  row = partition(word[0..6], 0, 127, "B")
  col = partition(word[7..-1], 0, 7, "R")
  row * 8 + col
end

ids = $<.read.lines.map(&:chomp).map! { |l| solve l }.sort!

puts "Part 1: #{ ids.last }"
puts "Part 2: #{ ids.each_cons(2).find { |(a, b)| b - a == 2 }&.yield_self { |a| a.sum / 2 } }"
