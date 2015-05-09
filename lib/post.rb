require_relative 'comment'
require_relative 'comment_parser'

class Post

  attr_reader  :title, :url, :points, :item_id, :comments

  def initialize(parser)
    @title = parser.title
    @url = parser.url
    @points = parser.points
    @item_id = parser.item_id
    @comments = []
    parse_all_comments(parser.doc)
  end

  def add_comment(comment)
    @comments << comment
  end

  def parse_all_comments(doc)
    comment_parser = CommentParser.new(doc)
    index = 0
    comment_parser.count_all_comments.times do
      comment = Comment.new
      comment.body = comment_parser.body(index)
      comment.user_name = comment_parser.user_name(index)
      add_comment(comment)
      index +=1
    end
  end

end
