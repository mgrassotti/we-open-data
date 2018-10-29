class JsonLoader
  attr_reader :data

  def initialize(path)
    @data = JSON.parse File.read("#{Rails.root}#{path}")
  end
end
