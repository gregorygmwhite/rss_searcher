require_relative "rss_reader.rb"
require 'pp'

class RSS_Keyword_Searcher 

  def initialize(feed_urls, keywords)
    @reader = RSS_Reader.new(feed_urls)
    @news_items = @reader.get_news_items
    @keywords = keywords
  end

  def get_links_of_interest(links_of_interest=Array.new)
    regex_string = @keywords.map(&:downcase).join("|")
    @news_items.each do |item|
      content = self.content_from_item(item)
      links_of_interest.push(item[:link]) if content =~ /#{regex_string}/
    end
    return links_of_interest
  end

  def content_from_item(item)
    return (item[:description]+item[:title]).downcase
  end

end