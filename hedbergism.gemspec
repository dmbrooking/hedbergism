Gem::Specification.new do |s| 
  s.name         = "hedbergism"
  s.version      = "1.0.2"
  s.author       = "Dan Brooking"
  s.email        = "dmbrooking@gmail.com"
  s.homepage     = "https://github.com/dmbrooking/"
  s.summary      = "Returns random Mitch Hedberg quotes"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'hedbergism' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end