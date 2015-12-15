#!/usr/bin/env ruby

puts $stdin.read.scan(/-?\d+/).map(&:to_i).inject(0, &:+)
