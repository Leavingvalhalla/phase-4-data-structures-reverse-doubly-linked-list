require_relative './node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def reverse!
# skip head, start iwht head.next
# reverse next and previous on node, then move to next one
#get to old_tail, rename both and get rid of their old next/prev, and add proper prev/next
    return if @head == @tail
    curr = @head.next_node
    @head.prev_node = @head.next_node
    @head.next_node = nil
    until curr == @tail
     placeholder = curr.next_node 
     curr.next_node = curr.prev_node
     curr.prev_node = placeholder
     curr = curr.prev_node
    end
    @tail.next_node = @tail.prev_node
    @tail.prev_node = nil
    placeholder = @head
    @head = @tail
    @tail = placeholder
  end
end
