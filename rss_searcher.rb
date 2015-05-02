require_relative "rss_keyword_finder.rb"
require_relative "file_reader.rb"

class RSS_Searcher

  def initialize(feeds, keywords)
    @feed_urls = File_Reader::get_lines(feeds)
    @keywords = File_Reader::get_lines(keywords)
  end

  def get_links_of_interest(match_level)
    searcher = RSS_Keyword_Searcher.new(@feed_urls, @keywords, match_level)
    return searcher.get_links_of_interest
  end

end

keywords = ["Vietnam", "China", "Money"]
feed_filname = "rss_feeds.txt"

searcher = RSS_Searcher.new(feed_filname, keywords)
pp searcher.get_links_of_interest("ONE_OR_MORE")