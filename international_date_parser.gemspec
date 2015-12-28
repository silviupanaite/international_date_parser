lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'international_date_parser/version'


Gem::Specification.new do |gem|
  gem.name                  = 'international_date_parser'
  gem.version               = InternationalDateParser::VERSION
  gem.authors               = ["Frenesim"]
  gem.email                 = 'hlsp999@gmail.com'
  gem.description           = "Ruby class Date wrapper to translate months and then parse the string"
  gem.summary               = "International Date Parser "
  gem.files                 = ["lib/international_date_parser.rb"]
  gem.homepage              = 'http://github.com/frenesim/international_date_parser'
  gem.license               = 'MIT'
  gem.require_paths         = ["lib"]
  gem.required_ruby_version = '>= 1.9.3'
end