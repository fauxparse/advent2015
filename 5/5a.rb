#!/usr/bin/env ruby

nice = $stdin.readlines.select do |s|
  s =~ /([aeiou].*){3,}/ &&
  s =~ /(.)\1/ &&
  s !~ /ab|cd|pq|xy/
end

puts "\n#{nice.count}"
