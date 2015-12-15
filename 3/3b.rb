#!/usr/bin/env ruby

DIRECTIONS = {
  ">" => [1, 0],
  "<" => [-1, 0],
  "^" => [0, -1],
  "v" => [0, 1]
}

santas = [[0, 0], [0, 0]]

houses = { [0, 0] => 1 }

$stdin.read.chars.each do |c|
  if d = DIRECTIONS[c]
    santas.first[0] += d[0]
    santas.first[1] += d[1]
    houses[santas.first.dup] = true
    santas.rotate!
  end
end

puts "\n#{houses.size}"
