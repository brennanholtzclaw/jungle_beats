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
  # Mind blowing - will .play run recursively? Just run that say line
  # several times in quick succession?
  # Am I being mind blown by something simple here?!
  # node.next_node = self

  def append(beat)
    @head.append(beat)
  end

  def prepend(beat)
    # binding.pry
    old_head = @head
    input = beat.split
    @head = Node.new([input.shift])
    input = input.reverse
    while !input.empty?
      @head.next_node = Node.new([input.shift])
    end
    @head.next_node = Node.new([input.shift]) if !input.empty?
    @head.next_node = old_head
    #test is passing in bleet blap
    # @head.next_node.data = old_head.data
    # @head = beat

    # prepend
    ### at the beginning of the list
  end

  def insert
    # insert
    ### one or more elements at an arbitrary position in the list
    ### (two args default tail)
  end

  def includes?(beat)
    @head.includes?(beat)
  end

  def pop(how_many=1)
    # still need to let pop take an argument for multiple beats
    # binding.pry
    # how_many.times do
      # binding.pry
      if @head.data == nil
        "This is an empty list"
      elsif @head.next_node.data == nil
        pop_data = @head.data
        @head = nil
        pop_data
      else
        @head.pop(how_many)

      # elsif @head.next_node.data != nil && @head.next_node.next_node.data == nil
      #   pop_data = @head.next_node.data
      #   # binding.pry
      #   @head.next_node = nil
      #   pop_data
      # elsif @head.next_node.next_node.data == nil
      #   pop_data = @head.next_node.next_node.data
      #   @head.next_node.next_node = nil
      #   pop_data
      # elsif @data.nil?
      #   puts "my data is nil"
      #   # binding.pry
      #   break
      # else
      #   @head.pop
      # end
      end
    # end
    # pop
    ### one or more elements from the end of the list
    ### (takes num arg - default 1)
  end

  def count
    @head.count
  end

  def find
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


# pseudo code through this linked list.
# do you need a node class and a list class?
# if done recursively, are both still needed?
  # Initial thoughts I didn't think so, now I think I'll need at least a node
    # class, but maybe not neccessarily a list class.
# Perhaps the junglebeat class takes in the string, and parses it out into
# the appropriate number of nodes, assigning data appropriatly
# from there you should ("should?") be able to call all methods recursively.
# Even though you're calling the method on the junglebeat object, it would pass
# it recursively to each node.

# Horace of course thinks 3 classes would be neccessary - I got a plausible
# when I threw out my two class idea...


# JB new should take the passed in data and create a new node for each word
# the first node created should be designated the head.
# The last node created should be designated the tail - THIS MAY BE OPTIONAL
