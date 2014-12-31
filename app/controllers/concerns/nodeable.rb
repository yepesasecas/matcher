module Nodeable
  extend ActiveSupport::Concerns

  def distance_to(node)
    pitagoras(coordinates, node.coordinates)
  end

  def nearest
    nearest = nil
    nearest_distance = nil

    self.class.all.each do |group|
      if nearest_distance.nil?
        nearest = group
      else
        distance = group.distance_to(nearest)
        if distance < nearest_distance
          nearest = group
          nearest_distance = distance
        end
      end
    end

    nearest
  end

  private

    def pitagoras(node_a_coordinates, node_b_coordinates)
      sum   = 0
      node_a_coordinates.each_with_index do |coord, index|
        p   = coord
        q   = node_b_coordinates[index]
        sum = sum + (p - q) ** 2
      end
      Math.sqrt(sum)
    end
end