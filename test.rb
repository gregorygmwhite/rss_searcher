require_relative 'rss_searcher.rb'
require 'pp'

keywords = ["Vietnam", "China", "Money"]
feed_filname = "rss_feeds.txt"
match_level = "ONE_OR_MORE"
last_three_days = Date.today - 3

searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
pp searcher.get_links_of_interest(match_level)