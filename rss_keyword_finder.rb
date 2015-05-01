require_relative "rss_reader.rb"
require 'pp'

class RSS_Seacher 
  attr_reader :links_of_interest
  def initialize
    reader = RSS_Reader.new("rss_feeds.txt")
    @news_items = reader.get_news_items
    @links_of_interest = Array.new
  end

  def search_for_keywords(keywords)
    regex_string = keywords.map(&:downcase).join("|")
    @news_items.each do |item|
      content = self.content_from_item(item)
      @links_of_interest.push(item[:link]) if content =~ /#{regex_string}/
    end
  end

  def content_from_item(item)
    return (item[:description]+item[:title]).downcase
  end

end