Gem::Specification.new do |gem|
  gem.authors       = ["Pedro Belo", "Adam Carlile"]
  gem.email         = ["pedro@heroku.com", "adam@musicglue.com"]
  gem.description   = %q{OmniAuth strategy for Music Glue, originally provided by Heroku}
  gem.summary       = %q{OmniAuth strategy for Heroku, originally provided by Heroku}
  gem.homepage      = "https://github.com/musicglue/omniauth-musicglue"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.name          = "omniauth-music_glue"
  gem.require_paths = ["lib"]
  gem.version       = "0.1.1"

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
