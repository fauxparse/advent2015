#!/usr/bin/env ruby

class Array
  def rotations
    (0...length).map { |i| rotate(i) }
  end
end

distances = $stdin.readlines.each.with_object({}) do |line, hash|
  match, from, to, distance = line.chomp.match(/(\w+) to (\w+) = (\d+)/).to_a
  if match
    (hash[from] ||= {})[to] = distance.to_i
    (hash[to] ||= {})[from] = distance.to_i
  end
end

def distance(path, distances)
  path
    .each_cons(2)
    .map { |from, to| distances[from][to] }
    .inject(&:+)
end

puts distances.keys.permutation(distances.size).to_a
  .map { |path| distance(path, distances) }
  .max
