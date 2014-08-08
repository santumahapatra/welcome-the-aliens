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


class DetailGenerator
  attr_reader :alien

  def initialize alien
    @alien = alien
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def export alien, format_of_file
    raise "Method not implemented"
  end

  def get_file_name file_ext
    "alien_#{alien.code_name}_#{Time.now.to_i}.#{file_ext}"
  end
end

class TxtDetailGenerator < DetailGenerator

  def self.respond_to format
    format == "plain text"
  end

  def export
    alien_txt_file = get_file_name "txt"

    FileUtils.touch alien_txt_file

    File.open(alien_txt_file, 'w') do |f|
      f.write "Welcome to Earth!!\n"
      f.write "Consider this your identity details on earth. Keep them with you.\n\n"
      f.write("Code Name: #{alien.code_name} \n")
      f.write("Blood Color: #{alien.blood_color} \n")
      f.write("Number of Antennas: #{alien.no_of_antennas} \n")
      f.write("Number of Legs: #{alien.no_of_legs} \n")
      f.write("Home Planet: #{alien.home_planet}")
    end
  end
end

class PdfDetailGenerator < DetailGenerator

  def self.respond_to format
    format == "PDF"
  end

  def export
    alien_pdf_file = get_file_name "pdf"

    pdf = Prawn::Document.new
    pdf.text "Welcome to Earth!!"
    pdf.text "Consider this your identity details on earth. Keep them with you.\n"
    pdf.text("Code Name: #{alien.code_name}")
    pdf.text("Blood Color: #{alien.blood_color}")
    pdf.text("Number of Antennas: #{alien.no_of_antennas}")
    pdf.text("Number of Legs: #{alien.no_of_legs}")
    pdf.text("Home Planet: #{alien.home_planet}")
    pdf.render_file alien_pdf_file
  end
end

