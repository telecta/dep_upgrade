
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dep_upgrade/version"

Gem::Specification.new do |spec|
  spec.name          = "dep_upgrade"
  spec.version       = DepUpgrade::VERSION
  spec.authors       = ["Huiming Teo"]
  spec.email         = ["teohuiming@gmail.com"]

  spec.summary       = %q{Keep your app dependencies up-to-date with rails dep:upgrade}
  spec.description   = "`rails dep:upgrade` runs `bundle update`," \
    " `bundle audit`, `yarn upgrade` and generates a markdown-style summary" \
    " of what have changed that you can paste into a pull/merge request."
  spec.homepage      = "https://github.com/blacktangent/dep_upgrade"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri" => "http://github.com/blacktangent/dep_upgrade/issues",
      "changelog_uri" => "https://github.com/blacktangent/dep_upgrade/blob/master/CHANGELOG.md",
      "homepage_uri" => "https://github.com/blacktangent/dep_upgrade",
      "source_code_uri" => "https://github.com/blacktangent/dep_upgrade"
    }
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "git-chlog"

  spec.add_dependency "bundler"
  spec.add_dependency "bundler-audit"
  spec.add_dependency "rake"
end
