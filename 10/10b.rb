#!/usr/bin/env ruby

digits = ARGV[0].dup

50.times { digits.gsub!(/(\d)(\1*)/) { |d| "#{d.length}#{d[0]}" } }

puts digits.size
