require 'pry'

class Node
  attr_accessor :data, :head, :tail, :next_node

  def initialize(data)
    # binding.pry
    @data = data.shift
    @link = true unless @data == nil
    @next_node = Node.new(data) unless @data == nil
#   @head = false
#   @tail = false
  end

#   def find_data
# # get data from every link after you and append that to a string AFTER your data"
#   end

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
