require_relative 'parser'
require_relative 'post'
require 'pp'

class Application

  attr_reader :parser

  def initialize(default='./post.html')
    ARGV << default if ARGV.empty?
    @parser = Parser.new(ARGV.shift)
  end

  def create_post
    Post.new(parser)
  end

end

app = Application.new
current_post = app.create_post
puts 'TITLE'
puts current_post.title
puts 'URL'
puts current_post.url
puts 'POINTS'
puts current_post.points
puts 'ITEM ID'
puts current_post.item_id
puts "___________________________________________"
puts 'COMMENTS'
pp current_post.comments
