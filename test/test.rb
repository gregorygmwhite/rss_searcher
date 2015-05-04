require_relative '../lib/rss_searcher.rb'
require 'rspec'

RSpec.describe "Searcher" do
  context "Different Match Levels" do
    it "should give back links for 'one or more' match level" do
      keywords = ["the", "asdfasdfasdfasdfnn;jiuiwe"]
      feed_filname = "../feeds/rss_feeds.txt"
      match_level = "ONE_OR_MORE"
      last_three_days = Date.today - 3
      searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
      expect(searcher.get_links_of_interest(match_level).length > 0)
    end

    it "should give no back links for 'all' match level with weird string in keywords" do
      keywords = ["the", "asdfasdfasdfasdfnn;jiuiwe"]
      feed_filname = "../feeds/rss_feeds.txt"
      match_level = "ALL"
      last_three_days = Date.today - 3
      searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
      expect(searcher.get_links_of_interest(match_level).length === 0)
    end

    it "should give some back links for '2%' match level" do
      keywords = ["the", "asdfasdfasdfasdfnn;jiuiwe"]
      feed_filname = "../feeds/rss_feeds.txt"
      match_level = 2
      last_three_days = Date.today - 3
      searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
      expect(searcher.get_links_of_interest(match_level).length > 0)
    end
  end

  context "Malformed inputs" do
    it "should give back empty array if given bad feed_filname" do
      keywords = ["the", "asdfasdfasdfasdfnn;jiuiwe"]
      feed_filname = "../feeds/non_existent_feeds.txt"
      match_level = "ONE_OR_MORE"
      last_three_days = Date.today - 3
      searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
      expect(searcher.get_links_of_interest(match_level).length == 0)
    end

    it "should give back an empty array for malformed match_level" do
      keywords = ["the", "asdfasdfasdfasdfnn;jiuiwe"]
      feed_filname = "../feeds/rss_feeds.txt"
      match_level = "asdfal;asfj;"
      last_three_days = Date.today - 3
      searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
      expect(searcher.get_links_of_interest(match_level).length == 0)
    end

    it "should give back an empty array for malformed feed urls" do
      keywords = ["the", "asdfasdfasdfasdfnn;jiuiwe"]
      feed_filname = "../feeds/bad_feeds.txt"
      match_level = "ONE_OR_MORE"
      last_three_days = Date.today - 3
      searcher = RSS_Searcher.new(feed_filname, keywords,last_three_days)
      expect(searcher.get_links_of_interest(match_level).length == 0)
    end

  end
end