require 'movies'

class Movie

  attr_accessor :title, :rating, :url, :poster_url, :plot

  def initialize(name)
    @name = name
  end

  def fetch
    imdb = Movies.find_by_release_name(@name)
    extract_info(imdb) if imdb.found?
  end

  private

  def extract_info(imdb)
    self.title = imdb.title
    self.rating = imdb.rating
    self.url = imdb.href
    self.poster_url = imdb.poster
    self.plot = imdb.plot
    self
  end

end
