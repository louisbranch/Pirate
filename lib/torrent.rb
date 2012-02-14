require_relative 'movie'
class Torrent

  attr_reader :id, :name, :url, :tracker, :magnet
  attr_accessor :movie

  def initialize id, name, url, tracker, magnet
    @id, @name, @url, @tracker, @magnet = id, name, url, tracker, magnet
  end

  def create_movie
   self.movie = Movie.new('J Edgar 2011 DVDRip XviD-PADDO')
  end

end
