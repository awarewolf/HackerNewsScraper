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
post = app.create_post
puts "@@@@@@@@\n██╗@@@██╗\n╚██╗@██╔╝\n@╚████╔╝@\n@@╚██╔╝@@\n@@@██║@@@\n@@@╚═╝@@@\n@@@@@@@@"
puts "HACKER NEWS POST SCRAPER"
puts "ITEM ID\t\tPOST TITLE"
puts "#{post.item_id}\t\t#{post.title}"
puts 'LINK URL'
puts post.url
puts 'POINTS'
puts post.points
puts 'ITEM ID'
puts
puts "_________________________________________________________________________"
puts 'COMMENTS'
pp post.comments
