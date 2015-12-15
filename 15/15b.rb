#!/usr/bin/env ruby

INGREDIENTS = $stdin.readlines.each.with_object({}) do |line, hash|
  name, properties = line.chomp.split(/:\s+/)
  hash[name] = properties.split(/,\s+/).map { |p| p.split(/\s+/).last.to_i } if name
end

def cookie(amounts)
  scores = amounts.to_a.map do |name, amount|
    INGREDIENTS[name][0...-1].map { |s| s * amount }
  end

  scores.first.zip(*scores[1..-1])
    .map { |s| [0, s.inject(&:+)].max }
    .inject(&:*)
end

def calories(amounts)
  amounts.to_a
    .map { |name, amount| INGREDIENTS[name].last * amount }
    .inject(&:+)
end

def solve(ingredients = INGREDIENTS.keys, used = {}, total = 100)
  return [used, calories(used) == 500 ? cookie(used) : 0] if ingredients.empty?
  
  ingredient, others = ingredients.first, ingredients[1..-1]

  ((ingredients.size == 1 ? total : 0)..total)
    .map { |a| solve(others, used.merge(ingredient => a), total - a) }
    .max { |a, b| a.last <=> b.last }
end

puts solve
