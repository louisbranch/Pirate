require 'spec_helper'
require 'movie'

describe Movie do

  let(:movie) do
    VCR.use_cassette('imdb_movie') do
      Movie.new('J Edgar').fetch
    end
  end

  it "has a title" do
    movie.title.should eq('J. Edgar (2011)')
  end

end
