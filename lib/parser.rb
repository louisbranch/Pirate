require 'open-uri'
require 'nokogiri'
require_relative 'torrent'

class Parser

  def initialize
    @url = "http://thepiratebay.se/top/201"
  end

  def fetch
    rows = doc.css('table#searchResult > tr > td[2]')
    create_torrents(rows)
  end

  private

  def doc
    Nokogiri::HTML(open(@url))
  end

  def create_torrents(rows)
    torrents = []
    rows.each do |row|
      torrents << extract_torrent_info(row)
    end
    torrents
  end

  def extract_torrent_info(row)
    url = extract_url(row)
    id = extract_pirate_id(url)
    name = extract_name(row)
    magnet = extract_magnet(row)
    tracker = extract_tracker(row)
    Torrent.new(id,name,url,magnet,tracker)
  end

  def extract_pirate_id(url)
    id = url.match(/\/torrent\/(\d+)/)[1]
  end

  def extract_name(row)
    row.css('.detName').text
  end

  def extract_url(row)
    url = row.at_css('.detName > a.detLink')['href']
    "http://www.thepiratebay.se#{url}"
  end

  def extract_magnet(row)
    row.at_css('a[3]')['href']
  end

  def extract_tracker(row)
    row.at_css('a[2]')['href']
  end

end
