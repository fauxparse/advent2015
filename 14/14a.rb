#!/usr/bin/env ruby

RULE = /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

class Reindeer
  attr_reader :name, :speed, :run, :rest
  
  def initialize(name, speed, run, rest)
    @name = name
    @speed = speed
    @run = run
    @rest = rest
  end
  
  def period
    run + rest
  end
  
  def distance(seconds)
    runs, remainder = seconds.divmod(period)
    (runs * run + [remainder, run].min) * speed
  end
end

reindeer = $stdin.readlines.map do |line|
  _, name, speed, run, rest = line.chomp.match(RULE).to_a
  Reindeer.new(name, speed.to_i, run.to_i, rest.to_i) if name
end.compact

duration = ARGV.first.to_i
puts reindeer.map { |r| r.distance(duration) }.max
