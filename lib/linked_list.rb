class LinkedList

  def get(nth_item)
    if nth_item == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < nth_item
      #while count <= nth_item - 1
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
  end
end
