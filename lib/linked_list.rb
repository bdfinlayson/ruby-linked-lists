require_relative 'linked_list_item'

class LinkedList
  attr_reader :size
  def initialize
    @size = 0
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

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(item)
      @last_item = @last_item.next_item
    end
      @size += 1
  end
end
