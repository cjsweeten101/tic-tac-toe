# frozen_string_literal: true

# For getting input from users
class Interface
  def self.get_input # rubocop:disable Naming/AccessorMethodName
    coords = prompt_user
    until (1..3).cover?(coords[0]) && (1..3).cover?(coords[1])
      puts 'Sorry, input not recognized'
      coords = prompt_user
    end
    coords
  end

  def self.prompt_user
    puts 'Enter a place to move, in the form x,y'
    input = gets.chomp
    input.split(',').map(&:to_i)
  end
end
