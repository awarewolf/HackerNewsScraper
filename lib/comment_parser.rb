require 'open-uri'
require 'nokogiri'

class CommentParser

  def initialize(doc)
    @doc = doc
  end

  def comments_zone
    @doc.css('td.default')
  end

  def count_all_comments
    comments_zone.css('span.comment > font:first-child').count
  end

  def comment(index)
    if comments_zone.css('span.comment')[index].nil?
      raise StandardError, "No comment at that index!"
    else
      comments_zone.css('span.comment')[index]
    end
  end

  def body(index)
     comment(index).inner_text.to_s.strip!
  end

  def comment_header(index)
    comments_zone.css('.comhead')[index]
  end

  def user_name(index)
     comment_header(index).css('a').first.children.inner_text.to_s
  end

end
