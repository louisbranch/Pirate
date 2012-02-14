require 'imdb'

class Movie

  attr_accessor :title

  def initialize(name)
    @name = name
  end

  def fetch
    imdb = Imdb::Movie.search(@name).first
    extract_info(imdb)
    self
  end

  private

  def extract_info(imdb)
    self.title = imdb.title
  end

end
