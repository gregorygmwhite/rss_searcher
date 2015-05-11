Gem::Specification.new do |s|
  s.name        = 'rss_searcher'
  s.version     = '0.1.1'
  s.date        = '2015-05-03'
  s.summary     = "This gem reads rss feeds and then searches them for keywords returning only stories of interest"
  s.description = "A simple rss feed curator based on keyword matches"
  s.authors     = ["Greg White"]
  s.email       = 'gwhite@dayspring-tech.com'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  # s.homepage    = 'http://rubygems.org/gems/rss_seacher'
  s.license       = 'MIT'
end