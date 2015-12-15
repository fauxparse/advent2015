#!/usr/bin/env ruby

require "digest/md5"

def mine(secret)
  i = 0
  while Digest::MD5.hexdigest(secret + i.to_s) !~ /^000000/
    i += 1
  end
  i
end

puts mine(ARGV[0])
