require_relative "rss_reader.rb"
require 'pp'


INTEREST_LEVEL_ALL = "ALL"
INTEREST_LEVEL_ONE_OR_MORE = "ONE_OR_MORE"

class RSS_Keyword_Searcher 

  def initialize(feed_urls, keywords, match_level)
    @reader = RSS_Reader.new(feed_urls)
    @news_items = @reader.get_news_items
    raise ArgumentError, "no keywords given" unless keywords.is_a?(Array) && keywords.length > 0
    @keywords = keywords
    raise ArgumentError, "invalid match_level" unless self.valid_match_level(match_level)
    @match_level = match_level
  end

  def get_links_of_interest(links_of_interest=Array.new)
    @news_items.each do |item|
      content = self.content_from_item(item)
      links_of_interest.push(item[:link]) if self.is_of_interest(content)
    end
    return links_of_interest
  end

  def is_of_interest(content)
    if(@match_level === INTEREST_LEVEL_ALL)
      regex_string = @keywords.inject("") {|ret, keyword| ret+"(?=.*#{keyword.downcase})"}
      return content =~ /#{regex_string}/
    elsif(@match_level === INTEREST_LEVEL_ONE_OR_MORE)
      regex_string = @keywords.map(&:downcase).join("|")
      return content =~ /#{regex_string}/
    elsif(@match_level.is_a?(Integer) && @match_level > 1 && @match_level < 100 )
      match_percentage = self.get_keyword_match_percentage(content)
      (match_percentage*100) > @match_level ? (return true) : (return false)
    else
      return false
    end
  end

  def event_triggered?(flag=false)
    @news_items.each do |item|
      content = self.content_from_item(item)
      flag = self.is_of_interest(content)
      return flag if flag
    end
    return flag
  end

  def get_keyword_match_percentage(content)
    match_count = 0
    @keywords.each do |keyword|
      if content.include?(keyword.downcase)
        match_count += 1 
      end
    end
    return (match_count * 1.0) / @keywords.length
  end

  def content_from_item(item)
    return (item[:description]+" "+item[:title]).downcase
  end

  def valid_match_level(match_level)
    return (match_level === INTEREST_LEVEL_ALL || match_level === INTEREST_LEVEL_ONE_OR_MORE || (match_level.is_a?(Integer) && match_level > 1 && match_level < 100))
  end

end