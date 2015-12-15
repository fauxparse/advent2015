#!/usr/bin/env ruby

nice = $stdin.readlines.select do |s|
  s =~ /(..).*\1/ &&
  s =~ /(.).\1/
end

puts "\n#{nice.count}"
