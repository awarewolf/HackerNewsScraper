require 'open-uri'
require 'nokogiri'

class Parser

  attr_reader :doc, :url, :item_id

  def initialize(url)
    @doc = Nokogiri::HTML(File.open(url),nil,'UTF-8')
    @item_id = url.gsub(/id=(\d{*})/, '\1')
  end

  def usernames
    doc.search('.comhead > a:first-child').map { |element| element.inner_text }
  end

  def points
    pts = doc.search('.subtext > span:first-child').map { |span| span.inner_text }
    pts[0].match(/(\d+)/).captures[0].to_i
  end

  def comments
    doc.search('.comment > font:first-child').map { |font| font.inner_text }
  end

  def url
    ( doc.search('.title > a:nth-child(2)').map { |link| link['href'] } )[0].to_s
  end

  def title
    ( doc.search('.title > a:nth-child(2)').map { |font| font.inner_text } )
  end

end