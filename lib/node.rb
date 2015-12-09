require 'pry'

class Node
  attr_accessor :data, :head, :tail, :next_node, :all_data

  def initialize(data)
    # binding.pry
    @data = data.shift
    @link = true unless @data == nil
    @next_node = Node.new(data) unless @data == nil
    @all_data = []
#   @head = false
#   @tail = false
  end

  def find_data
    # @all_data.unshift(@data)
    @all_data =
    #so, much like how count has to go all the way down and then come back up
    #all_data probably needs to run down the chain, find the end, and then be
    #EQUAL to the list that builds up in reverse
    @all_data << @data
    @next_node.all_data = @all_data
    # binding.pry
    @next_node.find_data if @next_node.data != nil
    @all_data if @next_node.data == nil
# get data from every link after you and append that to a string AFTER your data"
  end

  def play
    `say -r 500 -v Boing "#{@data}"`
    @next_node.play if @next_node.data != nil
    #this plays recursively, but it seems slow, I may want to grab all the
    #data and play directly from the JB class - might be easier with the
    #extension too.
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
      @next_node = Node.new([beat])
    else
      @next_node.append(beat)
    end
  end
end
