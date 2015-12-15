#!/usr/bin/env ruby

puts $stdin.readlines
  .map(&:chomp)
  .inject(0) { |memo, str| memo + str.length - eval(str).length }
