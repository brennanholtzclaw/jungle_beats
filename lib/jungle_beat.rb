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
    @head = Node.new([input[-1]])
    @head.next_node = old_head
    beats = (beat.split - (beat.split.pop.split)).join(" ")
    prepend(beats) if !beats.empty?
  end

  def pop(how_many=1)
    if @head.data == nil
      "This is an empty list"
    elsif @head.next_node.data == nil
      pop_data = @head.data
      @head = nil
      pop_data
    else
      (how_many - 1).times do
        @head.pop
      end
      @head.pop_data
    end
  end

  def insert(index, elements)
    elements.split.count.times do
      @head.insert(index, elements.split.shift)
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
  end

  def all
    @head.find_data if @head.data != nil
  end

end
