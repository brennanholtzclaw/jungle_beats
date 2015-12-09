require 'pry'
require './lib/node'

class JungleBeat
  attr_reader :head, :data

  def initialize(sounds)
    input = sounds.split
    @head = Node.new(input)
    # @head = Node.new(@input[0])

    # sounds.split[1..-1].each do |sound|
    #   Node.new(sound)
    # end

  end

  def play
    @head.play
    @head.count
  end
  # Mind blowing - will .play run recursively? Just run that say line
  # several times in quick succession?
  # Am I being mind blown by something simple here?!

  def append(beat)
    @head.append(beat)
    # if @next_node == nil
    #   @next_node = Node.new(beat)
    # else
    #   @next_node.append(beat)
    # end
    # input = beat.split
    # beats_to_append = []
    # input.each do |beat|
    #   beats_to_append << beat
    # end
    # beats_to_append.each do |beat|
    #   Node.new(beat)
    # end
    # end
    # node_beat = Node.new(input)
    # @head.append
    # append
    ### to the end of the list
  end

  def prepend
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
    # includes?
    ### gives back true or false
  end

  def pop
    # binding.pry
    if @head.data == nil
      "This is an empty list"
    elsif @head.next_node.data == nil
      pop_data = @head.data
      @head = nil
      pop_data
    elsif @head.next_node.data != nil && @head.next_node.next_node.data == nil
      pop_data = @head.next_node.data
      # binding.pry
      @head.next_node = nil
      pop_data
    elsif @head.next_node.next_node.data == nil
      pop_data = @head.next_node.next_node.data
      @head.next_node.next_node = nil
      pop_data
    else
      @head.pop
    end


    # pop
    ### one or more elements from the end of the list
    ### (two args, default 1)
  end

  def count
    @head.count
    # count
    ### the number of elements in the list
  end

  def find
    # find
    ### one or more elements based on arbitrary positions in the list.
    ### The first parameter indicates the first position to return
    ### And the second parameter specifies how many elements to return.
  end

  def all
    @head.data
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
