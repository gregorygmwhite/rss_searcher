# rss_searcher
A tool for curating rss feeds by keyword

##Usage
###Get the gem:
```
gem install rss_searcher
```
If you're using it in a bigger project, require in your Gemfile
```
gem rss_searcher
```
###The Interface
Initialize the class
```
searcher = Rss_Searcher.new
array_of_links = searcher.get_links_of_interest(rss_feeds, keywords, match_level, minimum_publish_date)
```
####rss_feeds:
Can be a path to a file of line separated urls to rss feeds or an array of urls to rss feeds.

####keywords:
Can be a path to a file of line separated keywords or an array of keywords.

####match_level:
#####"ONE_OR_MORE": 
One or more keywords must be found in the feed to be declared of interest.
#####"ALL": 
All keywords must be found in a feed to be declared of interest.
#####An Integer between 1-100:
Denoting the percentage of keywords that must be found in the feed to declare it of interest

####minimum_publish_date:
A date object denoting the last date an article can be published before it is considered not of interest

There you go! Questions, comments, concerns, contributions and issues welcome.
