Gem::Specification.new do |s|
  s.name        = 'fictionArt'
  s.version     = '0.0.8'
  s.executables << 'fictionArt'
  s.date        = '2018-06-29'
  s.summary     = "Display ascii art of animated fictional characters on your terminal"
  s.description = "A gem to show Ascii Art of fictional animated characters"
  s.authors     = ["Vaibhav Thakkar"]
  s.email       = 'vaibhav.thakkar.22.12.99@gmail.com'
  s.files       = Dir.glob('{images,lib}/*')
  s.required_ruby_version = '>= 2.0'

  s.add_dependency('rmagick', '2.16.0')
  s.add_dependency('rainbow', '3.0.0')

  s.homepage    = 'http://rubygems.org/gems/fictionArt'
  s.license     = 'MIT'
  s.metadata    = { "source_code_uri" => "https://github.com/vaithak/fictionArt" }
end
