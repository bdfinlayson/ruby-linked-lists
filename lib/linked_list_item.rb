class LinkedListItem
  include Comparable
  attr_accessor :payload
  attr_reader :next_item

  def initialize(data)
    @payload = data
  end


  def next_item= (data)
    raise ArgumentError if self == data
    #Note the = sign at the end of the method
    #When the interpreter sees the message
    #"next_item" followed by " =", it automatically ignores the space
    #before equal sign and reads the single message "next_item=" - a call to the method whose name is next_item=, which we've defined.
    #The = connotes a setter method
    #Ruby lets us define setter methods by placing
    #an = at the end
    #Ruby is smart enough to know to drop the = when we
    #call the setter method
    #so instead of a.next_item=('a value')
    #it would be a.next_item = 'a value'
    @next_item = data
  end

  def last?
    @next_item.nil? || false
  end

  def <=> another
    link1 = self.payload
    link2 = another.payload
    link1_val = if link1.is_a?(Symbol)
                  3
                elsif link1.is_a?(String)
                  2
                elsif link1.is_a?(Fixnum)
                  1
                end
    link2_val = if link2.is_a?(Symbol)
                  3
                elsif link2.is_a?(String)
                  2
                elsif link2.is_a?(Fixnum)
                  1
                end


    if link1.class == link2.class
      link1 <=> link2
    else
      link1_val <=> link2_val
    end

  end

  def === another
    self.inspect.eql?(another.inspect) || false
  end
end
