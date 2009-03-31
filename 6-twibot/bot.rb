#!/usr/bin/env ruby
require 'rubygems'
require 'twibot'

@knowlist = [:schouery]


# Direct messages (D)
message do |message, params|
  post_tweet "D #{message.sender.name} " + answer(message,params)
end

# replies (@)
reply :from => @knowlist do |message, params|
  post_tweet "@#{message.user.name} " + answer(message,params)
end

# public timeline

tweet do |message, params|
  puts message
end

def answer(message, params)
  return Time.now.to_s if message.text =~ /(horas)|(dia)/
  return "Reuniões do GOAT: Segundas às 18:00 na sala 254A do IME-USP" if message.text =~ /goat/
  return "pong" if message.text =~ /ping/
  return ""
end