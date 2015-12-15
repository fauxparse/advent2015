#!/usr/bin/env ruby

def ribbon(l, w, h)
  l, w, h = [l, w, h].sort
  2 * l + 2 * w + l * w * h
end

gifts = $stdin.readlines
puts "\n"

puts gifts.map { |line| ribbon(*line.strip.split("x").map(&:to_i)) }.inject(&:+)
