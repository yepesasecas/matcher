class Group < ActiveRecord::Base
  validates :weekend_value, presence: true
  validates :talk_about_value, presence: true
  validates :meet_value, presence: true
  validates :social_status_value, presence: true

  validates :weekend_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :talk_about_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :meet_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :social_status_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

  def coordinates
    [
      weekend_value, 
      talk_about_value, 
      meet_value, 
      social_status_value
    ]
  end

  def distance_to(node)
    pitagoras(coordinates, node.coordinates)
  end

  def nearest
    nearest = nil
    nearest_distance = nil

    Group.all.each do |group|
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
