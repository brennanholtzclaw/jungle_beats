require 'pry'

class Node
  attr_accessor :data, :head, :tail, :next_node, :all_data, :find_counter

  def initialize(data)
    # binding.pry
    @data = data.shift
    @link = true unless @data == nil
    @next_node = Node.new(data) unless @data == nil
    @all_data = [@data]
    @find_counter = 0
#   @head = false
#   @tail = false
  end

  def find_data
    # @all_data.unshift(@data)
    @all_data = @all_data << @next_node.find_data unless @next_node.data == nil
    #so, much like how count has to go all the way down and then come back up
    #all_data probably needs to run down the chain, find the end, and then be
    #EQUAL to the list that builds up in reverse
    # @all_data << @data
    # @next_node.all_data = @all_data
    # # binding.pry
    # @next_node.find_data if @next_node.data != nil
    # @all_data if @next_node.data == nil
# get data from every link after you and append that to a string AFTER your data"
  @all_data.flatten.join(" ")
  end


  def find(index, elements)
    if index == @find_counter
      @data
      # binding.pry
    elsif @data == nil
      puts "Not in here"
    else
      # binding.pry
      @next_node.find_counter = (@find_counter + 1)
      @next_node.find(index, elements)
    end
  end

  # def play
  #   `say -r 500 -v Boing "#{@data}"`
  #   @next_node.play if @next_node.data != nil
  #   #this plays recursively, but it seems slow, I may want to grab all the
  #   #data and play directly from the JB class - might be easier with the
  #   #extension too.
  # end

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

  def pop(how_many)
    # still need to let pop take an argument for multiple beats
    # binding.pry

    how_many.times do
      # binding.pry
      if @next_node.data != nil && @next_node.next_node.data == nil
        @pop_data = @next_node.data
        # binding.pry
        @next_node = nil
        @pop_data
      elsif @next_node.next_node.data == nil
        @pop_data = @next_node.next_node.data
        @next_node.next_node = nil
        @pop_data
      elsif @data.nil?
        puts "my data is nil"
        # binding.pry
        break
      else
        @next_node.pop(how_many)
      end
    end
    @pop_data
  end

end
