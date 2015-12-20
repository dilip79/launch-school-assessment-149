require 'pry'
class Robot
DIRECTIONS = [:north,:east,:south,:west]
attr_accessor :current_direction,:x,:y
def initialize
  @current_direction
  
end

def orient(direction)
  original_direction = DIRECTIONS.include?(direction) ? direction : ''
  if original_direction.empty?
    raise ArgumentError 
  else
    self.current_direction = original_direction
  end
  current_direction
end

def bearing
  current_direction
end

def turn_right
  case bearing
    when :north
    self.current_direction = :east
    when :east
    self.current_direction = :south
    when :south
    self.current_direction = :west
    when :west
    self.current_direction = :north
  end
end

def turn_left
  case bearing
    when :north
    self.current_direction = :west
    when :east
    self.current_direction = :north
    when :south
    self.current_direction = :east
    when :west
    self.current_direction = :south
  end
  
end

def at(x,y)
  self.x = x
  self.y = y
  
end

def coordinates
  [self.x,self.y]
  
end

def advance
  case self.current_direction
    when :north
    self.y = y + 1
    when :east
    self.x = x + 1
    when :south
    self.y = y - 1
    when :west
    self.x = x - 1
  end
  
end
end

class Simulator < Robot
  attr_accessor :simulator
  def initialize
    @simulator 
  end
  
  def instructions(str)
    str.split('').map do |item|
      case item
        when 'L'
        :turn_left
        when 'R'
        :turn_right
        when 'A'
        :advance
      end
    end
  end
  
  def place(robo,orientation)
    x = orientation[:x]
    y = orientation[:y]
    direction = orientation[:direction]
    robo.at(x,y)
    robo.orient(direction)
    
  end
  
  def evaluate(robo,str)
    instructions = self.instructions(str)
    instructions.each do |action|
      robo.send(action)
    end
    
  end
end