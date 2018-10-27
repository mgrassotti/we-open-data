module Cities
  PATH = "/lib/data/italy/cities.it.json"

  def self.all
    @data
  end

  def self.initialize
    @data = JSON.parse File.read("#{Rails.root}#{PATH}")
  end
end
