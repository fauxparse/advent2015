#!/usr/bin/env ruby

def paper(l, w, h)
  l, w, h = [l, w, h].sort
  3 * l * w + 2 * l * h + 2 * w * h
end

gifts = $stdin.readlines
puts "\n"

puts gifts.map { |line| paper(*line.strip.split("x").map(&:to_i)) }.inject(&:+)

