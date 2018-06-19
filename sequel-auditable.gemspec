# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "sequel-auditable"
  spec.version       = '0.1.0'
  spec.authors       = ["Richard Huang"]
  spec.email         = ["flyerhzm@gmail.com"]

  spec.summary       = %q{sequel auditable plugin}
  spec.description   = %q{auditable plugin for sequel}
  spec.homepage      = "https://github.com/prepsmith/sequel-auditable"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
