require 'pry'

class JungleBeat
  attr_reader :head, :data

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



  def initialize(sounds)
    @link = false
    @head = true
    @data = sounds
  end

  def link?
    @link
  end

  def play
    `say -r 500 -v Boing "#{@data}"`
    [@data].length
  end
  # Mind blowing - will .play run recursively? Just run that say line
  # several times in quick succession?
  # Am I being mind blown by something simple here?!

  
  # def data
  #   @data
  # end

  def append
  end

  def prepend
  end

  def insert
  end

  def includes?
  end

  def pop
  end

  def count
  end

  def find
  end

  def all
  end

end
