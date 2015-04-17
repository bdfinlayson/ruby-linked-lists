require_relative 'linked_list_item'

class LinkedList
  attr_reader :size
  attr_reader :last
  def initialize(*optional_arg)
    @size = 0
    if optional_arg[0]
      optional_arg.each { |x| push(x) }
    end
    #@args = optional_arg
  end

  def [](x)

  end

  def []=(x, y)
  end

  def to_s
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload
      punctuation = current_item.last? ? " " : ", "
      str << punctuation
      current_item = current_item.next_item #this line resets the current item so the loop goes out and gets the next item
    end
    str << "|"
    str
  end

  #version of to_s method given in class
=begin
  def to_s
    str = "| "
    #loop goes here
    size.times do |i|
      str << get(i) #get implicitly calls self
      if i == (size - 1)
        str << " "
      else
        str << ", "
      end
    end
    unless @first_item.nil?
      str << @first_item.payload + " "
    end
    str << "|"
    str
  end
=end


  def get(nth_item)
    if nth_item < 0 || @first_item.nil? || nth_item > @size
      raise IndexError
    end

    if nth_item == 0
      @first_item.payload
    elsif nth_item == 1
      @first_item.next_item.payload
    else
      count = 0
      current_node = @first_item
      while count < nth_item
        current_node = current_node.next_item
        count = count + 1
      end
      current_node.payload
    end
  end

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(item)
      @last_item = @last_item.next_item
    end
      @last = @last_item.payload
      @size += 1
  end
end

