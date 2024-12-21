# frozen_string_literal: true

require_relative '../app/rover.rb'

# class responsible for handling files
class RoverNavigator
  def initialize(file_path)
    @file_path = file_path
  end

  def navigate_rovers
    data = sanitize_input
    size = data[:size]

    data[:rovers].map do |rover|
      Rover.navigate(position: rover[:position], route: rover[:route], size: size)
    end
  end

  private

  def sanitize_input
    file = File.open(@file_path)
    lines = file.readlines
    size = lines[0].split.map(&:to_i).then { |x, y| { x: x, y: y } }

    rovers = []
    lines.drop(1).each_slice(2) do |position_line, route_line|
      position_data = position_line.split
      position = {
        x: position_data[0].to_i,
        y: position_data[1].to_i,
        cardinal_point: position_data[2]
      }

      route = route_line.chomp.chars

      rovers << { position: position, route: route }
    end

    { size: size, rovers: rovers }
  end
end

if __FILE__ == $PROGRAM_NAME
  # :nocov:
  puts RoverNavigator.new('input_rovers.txt').navigate_rovers
  # :nocov:
end
