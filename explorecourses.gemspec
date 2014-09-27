Gem::Specification.new do |s|
    s.name          = 'explorecourses'
    s.version       = '0.1.1'
    s.date          = '2014-09-26'
    s.summary       = 'Ruby wrapper for ExploreCourses API'
    s.description   = 'Allow Ruby programs to easily access the ExploreCourses API'
    s.authors       = ['Roger Chen']
    s.email         = 'rogerthechen@gmail.com'
    s.homepage      = 'https://rogr.me/projects/explorecourses-gem'
    s.license       = 'MIT'

    s.files        = `git ls-files`.split("\n")
    s.require_path = 'lib'

    s.add_dependency "nokogiri", "~> 1.6"
    s.add_dependency "typhoeus", "~> 0.6"
end