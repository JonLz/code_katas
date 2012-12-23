# In this kata we’re going to code up three implementations of a list that has the following basic interface:
# 
# The list consists of nodes. Each node has a string value, along with whatever housekeeping the list itself needs.
# New nodes are added to the end of the list.
# You can ask the list if it contains a given string. If it does, it returns the node containing that string.
# You can delete a node from the list.
# You can ask the list to return an array of all its values.

# Version 1: Each node points to the following node
class List
  class << self
    attr_accessor :value, :head, :curr
  end

  def self.initialize
  end

  def self.add(value)
    unless @curr.nil?
      @curr.ptr = Node.new(value)
      @curr  = @curr.ptr
    else 
      @curr = Node.new(value)
      @head = @curr
    end
    @curr || @head    
  end

  def self.find(value)
    ret = nil
    self.traverse { |node| ret = node if node.value == value }
    ret 
  end
  
  def self.values
    arr = Array.new
    self.traverse { |node| arr << node.value }
    arr
  end
 
  def self.delete(value)
  end

  def self.traverse(&block)
    return unless @head
    node = @head
    yield node
    while ( node.ptr )
      node = node.ptr
      yield node
    end
  end

end

class Node
  attr_accessor :value, :ptr
  def initialize(value, ptr=nil)
    @value = value
    @ptr = ptr
  end
end
  



require 'rspec'

describe List do
  it 'can add a head value to the list' do
    l = List
    l.add('fred')
    l.head.should be_kind_of Node
    l.head.ptr.should be_nil
  end

  it 'can add more values to the list with correct nodes' do
    l = List
    head = l.add('fred')
    curr = l.add('joey')
    head.value.should eq 'fred'
    head.ptr.should be_kind_of Node
    curr.ptr.should be_nil 
  end

  it 'can find a node given a value' do
    List.add('fred')
    n = List.find('fred')
    n.should be_kind_of Node
    n.value.should eq 'fred'
  end

  it 'can return an array of values' do
    # refactor so as to not rely on other tests to create the list values
    arr = %w[fred fred joey fred]
    List.values.should eq arr
  end
 
  it 'can delete a node' do
    # see refactor note above
    List.delete('fred')
    arr = %w[fred joey fred]
    List.values.should eq arr
  end
  end

end
