#!/usr/bin/env ruby

VALUES = { "(" => 1, ")" => -1 }

total = $stdin.read.strip
  .chars.map { |c| VALUES[c] }
  .compact
  .inject(&:+)

puts "\n#{total}"

