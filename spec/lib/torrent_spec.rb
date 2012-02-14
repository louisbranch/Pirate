require 'spec_helper'
require 'torrent'

describe Torrent do

  let(:torrent) { Torrent.new('7009211','The Godfather',nil,nil,nil) }

  it "creates a movie" do
    torrent.create_movie.should be_an_instance_of(Movie)
  end

end
