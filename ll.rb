#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

ll = LinkedList.new

payloads.each { |x| ll.push(x) }

size = ll.size

counter = 0
itemArr = []

while counter < size do
  item = ll.get(counter)
  itemArr << item.to_s.inspect
  counter += 1
end

starthingy = "* -> "
arrow = " -> "
n = "nil"

string = itemArr.join(' -> ') unless counter == 0

if itemArr.empty?
  output = starthingy + n
else
  output = starthingy + string + arrow + n
end

print output
