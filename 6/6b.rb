#!/usr/bin/env ruby

FORMAT = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/

grid = {}

$stdin.readlines.each do |line|
  _, instruction, *coords = line.match(FORMAT).to_a
  if instruction
    x1, y1, x2, y2 = coords.map(&:to_i)
    y1.upto(y2) do |y|
      x1.upto(x2) do |x|
        current = grid[[x, y]] || 0
        grid[[x, y]] = if instruction == "turn on"
          current + 1
        elsif instruction == "turn off"
          [0, current - 1].max
        elsif instruction == "toggle"
          current + 2
        else
          current
        end
      end
    end
  end
end

puts "\n"
puts grid.values.inject(&:+)
