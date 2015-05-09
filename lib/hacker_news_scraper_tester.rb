require 'nokogiri'
require 'pp'
require 'open-uri'

class HackerNewsScraper

  attr_reader :doc, :all_comments, :count_all_comments, :users

  def initialize(html="https://news.ycombinator.com/item?id=7663775")
    @doc = Nokogiri::HTML(open(html))
  end

  # def extract_usernames
  #   puts "Extract Usernames"
  #   doc.search('.comhead > a:first-child').map { |element| element.inner_text }
  # end

  # def extract_points
  #   puts "Extract Points"
  #   doc.search('.subtext > span:first-child').map { |span| span.inner_text }
  # end

  # def extract_link
  #   puts "Extract Link"
  #   doc.search('.title > a:first-child').map { |link| link.inner_text }
  # end

  # def extract_link2
  #   puts "Extract Link2"
  #   doc.search('.title > a:first-child').map { |link| link['href']}
  # end

  def all_comments
    doc.css('td.default')
  end

  def count_all_comments
    all_comments.css('span.comment > font:first-child').count
  end

  def comment(index)
    all_comments.css('span.comment')[index]
  end

  def body(index)
     comment(index).inner_text.to_s.strip!
  end

  def comment_header(index)
    all_comments.css('.comhead')[index]
  end

  def user(index)
     comment_header(index).css('a').first.children.inner_text.to_s
  end

  def users
     comment_header.css('a').first.children.inner_text
  end

end

def line
    puts "___________________________________________"
end

scraper = HackerNewsScraper.new
index = 0
pp scraper.body(0)
line
pp scraper.user(0)
line
pp scraper.count_all_comments
line
index = 0
pp scraper.count_all_comments#.times do
#   puts "#{scraper.user(index)} @ index #{index}"
#   index += 1
#   line
# end
# line
# line
# pp scraper.users