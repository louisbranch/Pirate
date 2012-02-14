require 'spec_helper'
require 'parser'

describe Parser do

  let(:parser) do
    VCR.use_cassette('top_movies') do
      Parser.new.fetch
    end
  end

  it "fetchs the top 100 movies from the page" do
    parser.should have(100).torrents
  end

  context "each result" do

    let(:torrent) { parser.sample }

    it "has a valid id" do
      torrent.id.should match(/\d+/)
    end

    it "has a name" do
      torrent.name.should_not be_empty
    end

    it "has a valid url" do
      torrent.url.should match(/http:\/\/www.thepiratebay.se\/torrent\/\d+\/.*/)
    end

    it "has a valid tracker link" do
      torrent.tracker.should match(/http:\/\/torrents.thepiratebay.se\/\d+\/.*\.torrent/)
    end

    it "has a valid magnetic link" do
      torrent.magnet.should match(/magnet:\?xt=urn:btih:\.*/)
    end

  end
end
