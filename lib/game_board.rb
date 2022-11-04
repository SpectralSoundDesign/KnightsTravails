require_relative 'knight.rb'

class GameBoard
  attr_accessor :board

  def initialize
    @board = []
    a = *(0..7)
    a.each do |i|
      a.each do |j|
        board.push(Node.new(i, j))
      end
    end
  end

  def find_node(data)
    i, j = data
    id = i * 8 + j
    board[id]
  end

  def on_board?(data)
    i, j = data

    if i > 7 || j > 7 || i < 0 || j < 0
      false
    else
      true
    end
  end

  def find_neighbors(node)
    x, y = node.current_pos

    n0 = find_node([x + 1, y + 2]) if on_board?([x + 1, y + 2])
    n1 = find_node([x + 2, y + 1]) if on_board?([x + 2, y + 1])
    n2 = find_node([x - 1, y + 2]) if on_board?([x - 1, y + 2])
    n3 = find_node([x - 2, y + 1]) if on_board?([x - 2, y + 1])

    n4 = find_node([x + 1, y - 2]) if on_board?([x + 1, y - 2])
    n5 = find_node([x + 2, y - 1]) if on_board?([x + 2, y - 1])
    n6 = find_node([x - 1, y - 2]) if on_board?([x - 1, y - 2])
    n7 = find_node([x - 2, y - 1]) if on_board?([x - 2, y - 1])

    node.neighbors = [n0, n1, n2, n3, n4, n5, n6, n7] - [nil]
  end

  def move_knight(start_pos, end_pos)
    start_node = find_node(start_pos)
    find_neighbors(start_node) 
    destination_node = find_node(end_pos)

    p start_node.current_pos
    
    queue = []

    start_node.visited = true
    queue.push(start_node)

    while queue.length > 0
      current_node = queue.shift

      current_node.neighbors.each do |n|
        if !n.visited
          p n.current_pos
          n.visited = true
          find_neighbors(n)
          queue.push(n)

          n.prev = current_node

          if n == destination_node
            queue.clear
            break
          end
        end
      end
    end
  end
end