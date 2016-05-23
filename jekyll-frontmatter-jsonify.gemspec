require File.expand_path '../lib/jekyll-frontmatter-jsonify/version', __FILE__

Gem::Specification.new do |s|
  s.name        = 'jekyll-frontmatter-jsonify'
  s.version     = Jekyll::FrontMatterJsonify::VERSION
  s.date        = Date.today.to_s
  s.summary     = "Output frontmatter of collections as JSON"
  s.description = "A liquid filter plugin for Jekyll which outputs the frontmatter of each item in a collection as a JSON array"
  s.authors     = ["City of Santa Monica"]
  s.email       = 'data@smgov.net'
  s.homepage    =
    'https://github.com/CityofSantaMonica/jekyll-frontmatter-jsonify'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "jekyll", '>= 2.4'
end
