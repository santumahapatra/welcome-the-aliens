require 'fileutils'
require 'prawn'
require_relative 'alien_input_console.rb'

attribute_store = {
       "code_name"=> {"type"=> "string", "message"=> "Code Name:"},
       "blood_color"=> {"type"=> "string", "message"=> "Blood Color:"},
       "no_of_antennas"=> {"type"=> "integer", "message"=> "Number of Antennas:"},
       "no_of_legs"=> {"type"=> "integer", "message"=> "Number of Legs:"},
       "home_planet"=> {"type"=> "string", "message"=> "Home Planet:"}
      }

friendly_alien_report = AlienInput.new
friendly_alien_report.execute attribute_store