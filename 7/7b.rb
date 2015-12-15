#!/usr/bin/env ruby

OPERATORS = {
  "AND"    => "&",
  "OR"     => "|",
  "NOT"    => "~",
  "LSHIFT" => "<<",
  "RSHIFT" => ">>"
}

wires = $stdin.readlines.each.with_object({}) do |line, hash|
  _, expression, variable = line.match(/^(.+)\s*->\s*(\w+)/).to_a
  hash[variable.strip] = expression.strip
end

def evaluate(expression, wires)
  case expression
  when Numeric, /^\d+$/ then expression.to_i
  when /^(\w+) AND (\w+)$/    then evaluate($1, wires) & evaluate($2, wires)
  when /^(\w+) OR (\w+)$/     then evaluate($1, wires) | evaluate($2, wires)
  when /^(\w+) LSHIFT (\d+)$/ then evaluate($1, wires) << evaluate($2, wires)
  when /^(\w+) RSHIFT (\d+)$/ then evaluate($1, wires) >> evaluate($2, wires)
  when /^NOT (\w+)$/          then ~evaluate($1, wires)
  when /^\w+$/ then wires[expression] = evaluate(wires[expression], wires)
  else
    raise "unknown expression: “#{expression}”"
  end
end

wires["b"] = evaluate("a", wires.dup)
puts evaluate("a", wires)
