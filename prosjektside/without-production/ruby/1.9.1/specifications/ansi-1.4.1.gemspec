# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ansi"
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Sawyer", "Florian Frank"]
  s.date = "2011-11-10"
  s.description = "The ANSI project is a collection of ANSI escape code related libraries enabling\nANSI code based colorization and stylization of output. It is very nice for\nbeautifying shell output."
  s.email = ["transfire@gmail.com"]
  s.extra_rdoc_files = ["HISTORY.rdoc", "README.rdoc", "QED.rdoc", "NOTICE.rdoc", "LICENSE.rdoc"]
  s.files = ["HISTORY.rdoc", "README.rdoc", "QED.rdoc", "NOTICE.rdoc", "LICENSE.rdoc"]
  s.homepage = "http://rubyworks.github.com/ansi"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "ANSI at your fingertips!"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<detroit>, [">= 0"])
      s.add_development_dependency(%q<qed>, [">= 0"])
      s.add_development_dependency(%q<lemon>, [">= 0"])
    else
      s.add_dependency(%q<detroit>, [">= 0"])
      s.add_dependency(%q<qed>, [">= 0"])
      s.add_dependency(%q<lemon>, [">= 0"])
    end
  else
    s.add_dependency(%q<detroit>, [">= 0"])
    s.add_dependency(%q<qed>, [">= 0"])
    s.add_dependency(%q<lemon>, [">= 0"])
  end
end
