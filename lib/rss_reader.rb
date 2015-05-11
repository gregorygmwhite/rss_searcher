require 'rss'
require 'open-uri'

class RSS_Reader

  def initialize(feed_urls)
    @feed_urls = feed_urls
  end

  # returns an array of rss items
  def get_news_items
    news_items = @feed_urls.each_with_object(Array.new) do |url, items|
      open(url) do |rss|
        feed = RSS::Parser.parse(rss, false)
        items.concat feed.items
      end
    end
    return news_items.empty? ? nil : news_items
  end

end
