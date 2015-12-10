require 'pry'

class Node
  attr_accessor :data, :head, :tail, :next_node, :all_data, :find_counter,
                :insert_counter, :pop_data

  def initialize(data)
    @data = data.shift
    @link = true unless @data == nil
    @next_node = Node.new(data) unless @data == nil
    @all_data = [@data]
    @find_counter = 0
    @insert_counter = 0
    @pop_data = []
  end

  def find_data
    @all_data = @all_data << @next_node.find_data unless @next_node.data == nil
    found_data = @all_data.flatten.join(" ")
    @all_data = [data]
    found_data
  end


  def find(index, elements)
    if index == @find_counter
      @data
    elsif @data == nil
      puts "Not in here"
    else
      @next_node.find_counter = (@find_counter + 1)
      @next_node.find(index, elements)
    end
  end

  def insert(index, elements)
    if @insert_counter == index
      old_next = @next_node
      @next_node = Node.new(["#{elements}"])
      @next_node.next_node = old_next
    elsif @data == nil
      puts "you shouldn't be here"
    else
      @next_node.insert_counter = (@insert_counter + 1)
      @next_node.insert(index, elements)
    end
  end

  def count
    if @data == nil
      0
    elsif @next_node == nil
      1
    else
      1 + (@next_node.count)
    end
  end

  def includes?(beat)
    if @data == beat
      true
    elsif @next_node == nil
      false
    else
      @next_node.includes?(beat)
    end
  end

  def append(beat)
    if @next_node.data == nil
      beat.split.count.times do
        sound = [beat.split.pop]
        old_next = @next_node
        @next_node = Node.new(sound)
        @next_node.next_node = old_next
        popped = beat.split.pop
        beat = beat.split - popped.split
        beat = beat.join(" ")
      end
    else
      @next_node.append(beat)
    end
  end

  def pop(how_many)
    how_many.times do
      pop_data(how_many)
    end
    @pop_data.join(" ")
  end

  def pop_data(how_many)
    if @next_node.data != nil && @next_node.next_node.data == nil
      @pop_data << @next_node.data
      @next_node = nil
    else
      @next_node.pop((how_many - 1))
    end
    @pop_data.join
  end

end
