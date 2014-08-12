class TxtDetailGenerator < DetailGenerator

  @@extension = {"file_ext"=>"txt", "display_type"=>"plain text"}

  def self.respond_to format
    format == @@extension["display_type"]
  end

  def self.display
    @@extension["display_type"]
  end

  def export
    alien_txt_file = get_file_name @@extension["file_ext"]

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