#!/usr/bin/env ruby

input = $<.read.split("\n\n")
fields = %w(byr iyr eyr hgt hcl ecl pid)

puts "Part 1: #{ input.map { |l| l.split(/:#?\w+\s?/) }.count { |a| (fields - a).empty? } }"

part2 = input.select do |line|
  [
    line.match(/\bbyr:(\d{4})\b/)&.yield_self { |m| m[1].to_i.between?(1920, 2002) },
    line.match(/\biyr:(\d{4})\b/)&.yield_self { |m| m[1].to_i.between?(2010, 2020) },
    line.match(/\beyr:(\d{4})\b/)&.yield_self { |m| m[1].to_i.between?(2020, 2030) },
    line.match?(/\bhcl:#[0-9a-f]{6}\b/),
    line.match?(/\becl:(amb|blu|brn|gry|grn|hzl|oth)\b/),
    line.match?(/\bpid:\d{9}\b/),
    line.match(/\bhgt:(\d{2,3})(cm|in)\b/)&.yield_self do |m|
      (m[2] == "cm" && m[1].to_i.between?(150, 193)) || (m[2] == "in" && m[1].to_i.between?(59, 76))
    end
  ].all?
end.count

puts "Part 2: #{ part2 }"
