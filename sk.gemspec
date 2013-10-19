# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'sk/version'

Gem::Specification.new do |s|
  s.name        = "sk"
  s.version     = Sk::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jordan Scales"]
  s.email       = ["scalesjordan@gmail.com"]
  s.homepage    = "http://github.com/jdan/sk"
  s.license     = 'MIT'

  s.summary     = "Project skeletons made easy"
  s.description = "Skeleton (sk) makes it easy to fetch pre-organized project outlines from your local machine or the internet - setting up your project directories in a cinch."

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.executables  = ['sk']
  s.require_path = 'lib'
end
