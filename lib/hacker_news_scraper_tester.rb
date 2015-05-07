require 'nokogiri'
require 'pp'

class HackerNewsScraper

  attr_reader :doc

  def initialize(html='./post.html')
    @doc = Nokogiri::HTML(File.open(html))
  end

  def extract_usernames
    puts "Extract Usernames"
    doc.search('.comhead > a:first-child').map { |element| element.inner_text }
  end

  def extract_points
    puts "Extract Points"
    doc.search('.subtext > span:first-child').map { |span| span.inner_text }
  end

  def extract_link
    puts "Extract Link"
    doc.search('.title > a:first-child').map { |link| link.inner_text }
  end

  def extract_link2
    puts "Extract Link2"
    doc.search('.title > a:first-child').map { |link| link['href']}
  end

  def extract_post_text
    puts "Extract Post Text"
    doc.search('.comment > font:first-child').map { |font| font.inner_text}
  end

end

def line
    puts "___________________________________________"
end

scraper = HackerNewsScraper.new
pp scraper.extract_usernames
line
pp scraper.extract_points
line
pp scraper.extract_link
line
pp scraper.extract_link2
line
pp scraper.extract_post_text
