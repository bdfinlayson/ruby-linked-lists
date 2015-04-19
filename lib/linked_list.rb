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

  def []=(index, value)
    get_item(index).payload = value
  end

  def to_s
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload.to_s
      punctuation = current_item.last? ? " " : ", "
      str << punctuation
      current_item = current_item.next_item #this line resets the current item so the loop goes out and gets the next item
    end
    str << "|"
    str
  end

  def delete(i)
   @size -= 1
    if i == 0
      @first_item = @first_item.next_item
    else
      previous_item = get_item(i - 1)
      next_item = previous_item.next_item.next_item
      previous_item.next_item = next_item
    end
  end

  def index(item_name)
    item = @first_item
    if item.nil?
      return nil
    end
    position = 0
    if item.payload == item_name
      return position
    else
      until item.nil?
        if item.payload == item_name
          return position
        else
          item = item.next_item
          position += 1
        end
      end
    end
    nil
  end

  def sorted?
    if @first_item.nil?
      return true
    end
    item = @first_item
      until item.nil? || item.last?
        if item > item.next_item
          return false
        else
          item = item.next_item
        end
      end
    true
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

  def swap_with_next(n)
    raise IndexError if n < 0 || n >= (@size - 1)

    if n == 0
      first = @first_item
      second = first.next_item

      first.next_item = second.next_item
      second.next_item = first
      @first_item = second
    else
      current_item = @first_item
      count = n - 1
      count.times do
        current_item = current_item.next_item
      end
      previous = current_item
      first = previous.next_item
      second = first.next_item

      previous.next_item = second
      first.next_item = second.next_item
      second.next_item = first
    end
  end

  def sort!
    if @size < 2
      self
    else
      count = @size - 1
      item = @first_item
      index = 0

      while true
        swap = false
        count.times do
          if item > item.next_item
            swap_with_next(index)
            swap = true
          else
            item = item.next_item
          end
          index += 1
        end

        break unless swap
        index = 0
        item = @first_item
      end

    end
    self
  end



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

  alias [] get

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


  def get_item(i)
    raise IndexError if i < 0 || i >= @size
    item = @first_item
    i.times do
      item = item.next_item
    end
    item
  end


end

