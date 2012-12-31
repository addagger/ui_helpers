# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ui_helpers/version'

Gem::Specification.new do |gem|
  gem.name          = "ui_helpers"
  gem.version       = UiHelpers::VERSION
  gem.authors       = ["Valery Kvon"]
  gem.email         = ["addagger@gmail.com"]
  gem.homepage      = %q{http://vkvon.ru/projects/ui_helpers}
  gem.description   = %q{Buttons Icons Overlays and other design features from JQuery UI}
  gem.summary       = %q{JQuery UI helpers for Rails}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.licenses       = ['MIT']
end
