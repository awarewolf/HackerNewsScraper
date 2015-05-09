require_relative 'post_parser'
require_relative 'post'
require 'pry'
require 'pp'

class Application

  attr_reader :create_post, :post_parser

  def initialize()#'./post.html')
    default = './post.html'#"https://news.ycombinator.com/item?id=7663775"
    if ARGV.empty?
      ARGV << default
      local_file = true
    else
      local_file = false
    end
    @post_parser = PostParser.new(ARGV.shift,local_file)
    create_post(post_parser)
  end

  def create_post(parser=@post_parser)
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
