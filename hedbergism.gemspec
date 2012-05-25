Gem::Specification.new do |s| 
  s.name         = "hedbergism"
  s.version      = "1.0.4"
  s.author       = "Dan Brooking"
  s.email        = "dmbrooking@gmail.com"
  s.homepage     = "https://github.com/dmbrooking/"
  s.summary      = "Returns random Mitch Hedberg quotes"
  s.description  = "This is just a REALLY simple RubyGem that will return a random Mitch Hedberg quote.  I decided to do this after taking a course on Ruby - I thought I could force it into being a little more complicated to test some of what I learned.... but this is about as simple as it gets.

  From a pure OO standpoint, there probably are some issues with this implementation, regardless of how simple it is.  The Quote object probably shouldn't handle printing to the screen.  But that's how I did it... maybe I'll enhance it that.  Maybe make a Printable mix-in that handle outputting in different format?"

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'hedbergism' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
