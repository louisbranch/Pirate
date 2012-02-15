require 'spec_helper'
require 'movie'

describe Movie do

  let(:movie) do
    VCR.use_cassette('imdb_movie') do
      Movie.new('J Edgar').fetch
    end
  end

  it "has a title" do
    movie.title.should_not be_empty
  end

  it "has a rating" do
    movie.rating.should be_an_instance_of(Float)
  end

  it "has an IMDB url" do
    movie.url.should match(/http:\/\/www.imdb.com\/title\//)
  end

  it "has a poster url" do
    movie.poster_url.should match(/http:\/\/ia.media-imdb.com\/images\//)
  end

  it "has a plot" do
    movie.plot.should_not be_empty
  end

end
