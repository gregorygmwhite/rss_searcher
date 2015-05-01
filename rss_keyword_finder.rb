require_relative "rss_reader.rb"
require 'pp'

reader = RSS_Reader.new("rss_feeds.txt")
pp reader.get_news_items
