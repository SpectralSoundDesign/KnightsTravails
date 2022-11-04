class Node
  attr_accessor :current_pos, :neighbors, :prev, :visited

  def initialize(x_cor = nil, y_cor = nil)
    @current_pos = [x_cor, y_cor]
    @neighbors = []
    @prev = nil
    @visited = false
  end
end