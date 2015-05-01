require_relative "xml_to_hash.rb"

class RSS_Reader

  def initialize(file_name)
    return null if !file_name
    @feed_urls = File.readlines(file_name).each_with_object(Array.new) do |line, urls|
      #TODO check if valid url
      urls.push line
    end
  end

  def get_news_items
    news_items = @feed_urls.each_with_object(Array.new) do |url, items|
      raw_rss_content = `curl #{url}`
      #TODO check if valid rss
      rss_content = Hash.from_xml raw_rss_content
      items.concat rss_content[:rss][:channel][:item]
    end
    return news_items.empty? ? nil : news_items
  end

end