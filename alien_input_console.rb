require_relative 'alien.rb'

class AlienInput
  attr_accessor :alien_values

  def execute attribute_store
    alien_values = get_input attribute_store
    alien = Alien.new(alien_values)
    generate_output alien
  end

  def get_input attribute_store
    puts "Hey there, fellow living being!! Welcome to Earth. "
    puts "We just need a few details from you"

    puts "Please enter the following details:"

    alien_values = {}

    attribute_store.each do |name, attributes|
      puts "#{attributes["message"].to_s}"
      alien_values["#{name.to_s}"] = check_type(attributes["type"].to_s)
    end

    alien_values
  end

  def check_type format_type
    if format_type == "integer"
      get_integer_input
    else format_type == "string"
      get_string_input
    end
  end

  def get_integer_input
   input = gets.chomp
   while input && !(input == input.to_i.to_s)
    puts "Please insert an integer for the field" 
    input = gets.chomp
   end
   input = input.to_s
  end

  def get_string_input
    input = gets.chomp
    while input && (input == input.to_i.to_s)
      puts "Please insert a string for the field" 
      input = gets.chomp
    end
    input.to_s
  end

  def generate_output alien
    detail_generator_class = nil
    while detail_generator_class.nil?
      puts "Which format do you want your file in :"
      puts "Please enter 'plain text' or 'PDF'"
      format_of_file = gets.chomp.to_s
      detail_generator_class = DetailGenerator.descendants.detect { |klass| klass.respond_to format_of_file }
    end

    detail_generator_class.new(alien).export
  end

end