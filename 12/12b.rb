#!/usr/bin/env ruby

require "json"

def value(obj)
  case obj
  when Hash
    if obj.values.include?("red")
      0
    else
      (obj.keys + obj.values).map { |k| value(k) }.inject(0, &:+)
    end
  when Array
    obj.map { |k| value(k) }.inject(0, &:+)
  else obj.to_i
  end
end

puts $stdin.readlines.map { |line| value(JSON.parse(line)) }.inject(0, &:+)
