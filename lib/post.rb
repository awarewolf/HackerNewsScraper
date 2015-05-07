require_relative 'comment'

class Post

  attr_reader  :title, :url, :points, :item_id, :comments

  def initialize(parser)
    @title = parser.title
    @url = parser.url
    @points = parser.points
    @item_id = parser.item_id
    @comments = []
    parser.comments.each { |text| add_comment(Comment.new(text)) }
  end

  def add_comment(comment)
    @comments << comment
  end

end