require 'pry'
require './lib/node'

class JungleBeat
  attr_reader :head, :data

  def initialize(sounds)
    input = sounds.split
    @head = Node.new(input)
  end

  def play
    # @head.play
    beats = @head.find_data
    `say -r 500 -v Boing "#{beats}"`
    @head.count
  end

  def append(beat)
    @head.append(beat)
  end

  def prepend(beat)
    old_head = @head
    input = beat.split
    @head = Node.new([input.shift])
    input = input.reverse
    while !input.empty?
      @head.next_node = Node.new([input.shift])
    end
    @head.next_node = Node.new([input.shift]) if !input.empty?
    @head.next_node = old_head
    # prepend
    ### at the beginning of the list
  end

  def insert(index, elements)
    @head.insert(index, elements)
    all
    # insert
    ### one or more elements at an arbitrary position in the list
    ### (two args default tail)
  end

  def includes?(beat)
    @head.includes?(beat)
  end

  def pop(how_many=1)
    if @head.data == nil
      "This is an empty list"
    elsif @head.next_node.data == nil
      pop_data = @head.data
      @head = nil
      pop_data
    else
      @head.pop(how_many)
    end
    ### one or more elements from the end of the list
    ### (takes num arg - default 1)
  end

  def count
    @head.count
  end

  def find(index, elements = 1)
    if index == 0 && elements == 1
      @head.data
    elsif index != 0 && elements == 1
      @head.find(index, elements)
    else
      all.split[index..(index + (elements - 1))].join(" ")
    end

  #  for multiple elements - consider acting as if you're just getting one
  #    then shovel that into a string, and repeat as many times as #{elements}
    #  unless index == 0

    # find
    ### one or more elements based on arbitrary positions in the list.
    ### The first parameter indicates the first position to return
    ### And the second parameter specifies how many elements to return.
  end

  def all
    @head.find_data if @head.data != nil
    # binding.pry
    # @head.find_data
    # if @head.data == nil
    #   nil
    # else
    #   @head.find_data if @head.data != nil
    # end
    # @head.data
    # @head.find_data
    # all
    ### return all elements in the linked list in order
    # this will need to change to @head.find_data once recursion and
    # multiple nodes come in to play
  end

end
