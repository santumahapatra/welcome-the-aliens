class Alien
  attr_accessor :code_name, :blood_color, :no_of_antennas, :no_of_legs, :home_planet

  def initialize alien_attributes
     @code_name = alien_attributes["code_name"]
     @blood_color = alien_attributes["blood_color"]
     @no_of_antennas = alien_attributes["no_of_antennas"]
     @no_of_legs = alien_attributes["no_of_legs"]
     @home_planet = alien_attributes["home_planet"]
  end 
end