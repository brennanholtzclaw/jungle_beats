require 'pry'
require './lib/node'

class JungleBeat
  attr_accessor :rate, :voice
  attr_reader :head, :data

  def initialize(sounds)
    input = sounds.split
    @head = Node.new(input)
    @rate = "500"
    @voice = "Boing"
  end

  def play
    beats = all
    `say -r #{@rate} -v #{@voice} "#{beats}"`
    @head.count
  end

  def reset_rate
    @rate = "500"
  end

  def rate(num)
    @rate = num.to_s
  end

  def voice(name)
    @voice = name.upcase
  end

  def reset_voice
    @voice = "Boing"
  end

  def append(beat)
    @head.append(beat)
    beat.split.count
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

  def insert(index, elements)
    elements.split.count.times do
      @head.insert(index, elements.split.shift)
      # binding.pry
      elements = (elements.split - ([elements.split.shift])).join(" ")
      index += 1
    end
    all
  end

  def includes?(beat)
    @head.includes?(beat)
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
  end

end
