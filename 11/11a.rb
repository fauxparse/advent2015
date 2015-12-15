#!/usr/bin/env ruby

password = ARGV[0].dup

STRAIGHTS = ('a'..'z').each_cons(3).to_a.map(&:join).freeze

def valid?(candidate)
  STRAIGHTS.any? { |straight| candidate.include?(straight) } &&
  candidate !~ /[iol]/ &&
  candidate =~ /(.)\1.*(.)\2/ &&
  true
end

loop do
  password.succ!
  break if valid?(password)
end

puts password
