require_relative 'knight.rb'

class GameBoard
  attr_accessor :nodes

  def initialize(start_pos, end_pos)
    @nodes = []
    @start_node = Node.new(start_pos[0], start_pos[1])
    @end_pos = end_pos
    @visited = []
  end

  def create_nodes
    (1..8).each do |i|
      (1..8).each do |j|
        square = Node.new(j, i)
        @nodes.push(square)
      end
    end
  end

  def find_neighbors(current_node)
    n = current_node
    new_pos = [n.current_pos[0] + 1, n.current_pos[1] + 2]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] + 2, n.current_pos[1] + 1]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] - 1, n.current_pos[1] + 2]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] - 2, n.current_pos[1] + 1]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] + 1, n.current_pos[1] - 2]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] + 2, n.current_pos[1] - 1]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] - 1, n.current_pos[1] - 2]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
    new_pos = [n.current_pos[0] - 2, n.current_pos[1] - 1]
    if ((new_pos[0] > 0 && new_pos[1] > 0) && (new_pos[0] < 9 && new_pos[1] < 9))
      n.neighbors.push(find_node(new_pos))
    end
  end

  def create_tree(current_node = @start_node, destination = @end_pos)
    
  end

  def find_node(pos)
    @nodes.each do |n|
      if n.current_pos == pos
        return n
      end
    end
  end

  def print_graph
    @nodes.each_with_index do |v, i|
      if i % 8 == 0
        p "\n"
      end

      print " #{v.current_pos} ||"
    end
  end
end