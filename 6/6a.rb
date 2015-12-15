#!/usr/bin/env ruby

FORMAT = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/

grid = {}

$stdin.readlines.each do |line|
  _, instruction, *coords = line.match(FORMAT).to_a
  if instruction
    x1, y1, x2, y2 = coords.map(&:to_i)
    y1.upto(y2) do |y|
      x1.upto(x2) do |x|
        grid[[x, y]] = if instruction == "turn on"
          true
        elsif instruction == "turn off"
          false
        elsif instruction == "toggle"
          !grid[[x, y]]
        else
          !!grid[[x, y]]
        end
      end
    end
  end
end

puts "\n"
puts grid.values.count(true)
