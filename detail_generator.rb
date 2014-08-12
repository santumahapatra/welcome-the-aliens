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