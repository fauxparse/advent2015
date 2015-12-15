#!/usr/bin/env ruby

DIRECTIONS = {
  ">" => [1, 0],
  "<" => [-1, 0],
  "^" => [0, -1],
  "v" => [0, 1]
}

x = y = 0
houses = { [0, 0] => 1 }

$stdin.read.chars.each do |c|
  if d = DIRECTIONS[c]
    x += d[0]
    y += d[1]
    houses[[x, y]] = true
  end
end

puts "\n#{houses.size}"
