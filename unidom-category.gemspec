$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/category/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-category'
  spec.version     = ::Unidom::Category::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-category'
  spec.summary     = 'The Category domain model engine includes Category and its relative models.'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Category domain model engine includes Category and its relative models. Unidom (统一领域对象模型)是一系列的领域模型引擎。类别领域模型引擎包括类别及其相关的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '~> 0.2'

end
