$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "media/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "crabgrass_media"
  s.version     = Media::VERSION
  s.authors     = ["Azul"]
  s.email       = ["azul@riseup.net"]
  s.homepage    = "https://github.com/riseuplabs/crabgrass-media"
  s.summary     = "Media processing for the Crabgrass social wiki"
  s.description = <<-EOD
    Crabgrass::Media is the Media engine of Crabgrass.

    Crabgrass is a web application designed for activist groups to be better able to collaborate online. Mostly, it is a glorified wiki with fine-grain control over access rights.

    Crabgrass::Media is a rails engine to do media transformations.
  EOD
  s.license     = "AGPL 3"

  s.files = Dir["{config,lib}/**/*", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'activesupport', '>= 3.2'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
