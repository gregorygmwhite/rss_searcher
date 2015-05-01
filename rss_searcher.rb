require_relative "rss_keyword_finder.rb"

keywords = ["Vietnam", "China", "Money"]

searcher = RSS_Seacher.new
searcher.search_for_keywords(keywords)
links_of_interest = searcher.links_of_interest

pp links_of_interest