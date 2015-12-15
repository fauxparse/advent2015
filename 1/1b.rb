#!/usr/bin/env ruby

VALUES = { "(" => 1, ")" => -1 }

floor = 0
$stdin.read.strip.chars
  .each.with_index(1) do |c, index|
    puts "\n#{index}" or break if (floor += VALUES[c]) < 0
  end
