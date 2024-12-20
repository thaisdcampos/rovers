# frozen_string_literal: true

require './move_rover'

# Main class responsable to handle with files
class Rover
  file = File.open('input_rovers.txt')
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

  rovers.each do |rover|
    puts MoveRover.execute(position: rover[:position], route: rover[:route], size:)
  end
end
