require 'open-uri'
require 'nokogiri'

class PostParser

  attr_reader :doc, :item_id, :title, :url, :points, :comments

  def initialize(html_input,local_file)
    @doc = make_doc(html_input, local_file)
    @item_id = html_input.match(/(\d+)/).captures[0].to_i
    @title = get_title
    @url = get_url
    @points = get_points
  end

  def make_doc(html_input,local_file)
    if local_file
      Nokogiri::HTML(File.open(html_input))
    else
      Nokogiri::HTML(open(html_input),nil,'UTF-8')
    end
  end

  def get_title
    ( doc.search('.title > a:nth-child(2)').map { |font| font.inner_text } )
  end

  def get_url
    ( doc.search('.title > a:nth-child(2)').map { |link| link['href'] } )[0].to_s
  end

  def get_points
    pts = doc.search('.subtext > span:first-child').map { |span| span.inner_text }
    pts[0].match(/(\d+)/).captures[0].to_i
  end

end
