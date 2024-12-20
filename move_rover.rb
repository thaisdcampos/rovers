# frozen_string_literal: true

# Responsable to move the robots
class MoveRover
  DIRECTIONS = %w[N E S W].freeze
  MOVES = {
    'N' => { x: 0, y: 1 },
    'E' => { x: 1, y: 0 },
    'S' => { x: 0, y: -1 },
    'W' => { x: -1, y: 0 }
  }.freeze

  def initialize(position:, route:, size:)
    @position = position
    @route = route
    @size = size
  end

  def self.execute(position:, route:, size:)
    new(position: position, route: route, size: size).execute
  end

  def execute
    return if invalid_position?

    move_rover
    @position
  end

  private

  def move_rover
    @route.each do |command|
      case command
      when 'R', 'L'
        rotate(command)
      else
        move_foward
      end
    end
  end

  def rotate(direction)
    step = direction == 'R' ? 1 : -1
    @position[:cardinal_point] = DIRECTIONS[(DIRECTIONS.index(@position[:cardinal_point]) + step) % 4]
  end

  def move_foward
    move = MOVES[@position[:cardinal_point]]

    @position[:x] += move[:x]
    @position[:y] += move[:y]
  end

  def invalid_position?
    @position[:x] >= @size[:x] && @position[:y] >= @size[:y]
  end
end
