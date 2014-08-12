class PdfDetailGenerator < DetailGenerator

  @@extension = {"file_ext"=>"pdf", "display_type"=>"PDF"}

  def self.respond_to format
    format == @@extension["display_type"]
  end

  def self.display
    @@extension["display_type"]
  end

  def export
    alien_pdf_file = get_file_name @@extension["file_ext"]

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