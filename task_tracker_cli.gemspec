Gem::Specification.new do |spec|
  spec.name          = "task_tracker_cli"
  spec.version       = "0.1.1"
  spec.authors       = ["Sulman Baig"]
  spec.email         = ["sulmanweb@gmail.com"]

  spec.summary       = "A CLI tool for tracking tasks."
  spec.description   = "A command-line interface tool to add, update, and manage tasks."
  spec.homepage      = "https://github.com/sulmanweb/task_tracker_cli"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + Dir["bin/*"] + ["task_tracker_cli.gemspec", "README.md"]
  spec.bindir        = "bin"
  spec.executables   = ["task-cli"]
  spec.require_paths = ["lib"]

  spec.metadata["homepage_uri"]          = spec.homepage
  spec.metadata["source_code_uri"]       = "https://github.com/sulmanweb/task_tracker_cli/blob/main/lib/task_tracker_cli.rb"
  spec.extra_rdoc_files                  = %w[README.md]
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_runtime_dependency 'json', '~> 2.0'
  spec.required_ruby_version = '>= 2.5.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.post_install_message = "Thank you for installing Task Tracker CLI by Sulman Baig!"
end
