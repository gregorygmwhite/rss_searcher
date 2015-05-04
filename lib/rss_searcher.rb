require_relative "rss_keyword_finder.rb"
require_relative "file_reader.rb"

class RSS_Searcher

  def initialize(feeds, keywords, minimum_publish_date=Date.today)
    @feed_urls = File_Reader::get_lines(feeds)
    @keywords = File_Reader::get_lines(keywords)
    @minimum_publish_date = minimum_publish_date
  end

  def get_links_of_interest(match_level="ONE_OR_MORE")
    return Array.new unless @feed_urls && @keywords && @minimum_publish_date
    links_of_interest = Array.new
    begin
      searcher = RSS_Keyword_Searcher.new(@feed_urls, @keywords, match_level, @minimum_publish_date)
      links_of_interest = searcher.get_links_of_interest
    rescue ArgumentError => ae
      puts ae.message
      links_of_interest = Array.new
    end
    return links_of_interest
  end

end