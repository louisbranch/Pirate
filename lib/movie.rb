require 'imdb'

class Movie

  attr_accessor :title, :genres, :rating, :year

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
    self.genres = imdb.director
  end

end
