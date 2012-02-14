require 'movies'
module TorrentCircle

  class Movie

    attr :title

    def initializer(name)
      imdb = Movies.find_by_release_name(name)
      @title = imdb.director
    end

  end

end
