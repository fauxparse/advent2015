#!/usr/bin/env ruby

VERBS = { "gain" => 1, "lose" => -1 }

rules = $stdin.readlines.each.with_object({}) do |line, hash|
  _, a, verb, delta, b = line.match(/(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)./).to_a
  (hash[a] ||= {})[b] = VERBS[verb] * delta.to_i if a
end

puts rules.inspect

def value(permutation, rules)
  (permutation + [permutation.first]).each_cons(2).inject(0) do |acc, (a, b)|
    acc + rules[a][b] + rules[b][a]
  end
end

names = rules.keys
candidates = names[1..-1].permutation(rules.size - 1).map { |p| [names.first] + p }

puts candidates.map { |p| value(p, rules) }.max
