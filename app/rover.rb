# frozen_string_literal: true

# Responsable to move the robots
class Rover
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

  def self.navigate(position:, route:, size:)
    new(position: position, route: route, size: size).navigate
  end

  def navigate
    return if out_of_bounds?(@position[:x], @position[:y])

    move_rover
    finish_position
  end

  private

  def move_rover
    @route.each do |command|
      case command
      when 'R', 'L'
        rotate(command)
      else
        move_forward
      end
    end
  end

  def rotate(direction)
    step = direction == 'R' ? 1 : -1
    @position[:cardinal_point] = DIRECTIONS[(DIRECTIONS.index(@position[:cardinal_point]) + step) % 4]
  end

  def move_forward
    move = MOVES[@position[:cardinal_point]]

    raise 'Invalid move: out of bounds!' if invalid_destination?(move)

    @position[:x] += move[:x]
    @position[:y] += move[:y]
  end

  def invalid_destination?(move)
    x_axis = @position[:x] + move[:x]
    y_axis = @position[:y] + move[:y]

    out_of_bounds?(x_axis, y_axis)
  end

  def out_of_bounds?(x_axis, y_axis)
    x_axis.negative? || y_axis.negative? || x_axis > @size[:x] || y_axis > @size[:y]
  end

  def finish_position
    "#{@position[:x]} #{@position[:y]} #{@position[:cardinal_point]}"
  end
end
