# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gdata4ruby}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Reich"]
  s.date = %q{2010-08-15}
  s.description = %q{A full featured wrapper for interacting with the base Google Data API, including authentication and basic object handling}
  s.email = %q{mike@seabourneconsulting.com}
  s.files = ["README", "CHANGELOG", "lib/gdata4ruby.rb", "lib/gdata4ruby/base.rb", "lib/gdata4ruby/service.rb", "lib/gdata4ruby/request.rb", "lib/gdata4ruby/gdata_object.rb", "lib/gdata4ruby/utils/utils.rb", "lib/gdata4ruby/acl/access_rule.rb", "test/unit.rb"]
  s.homepage = %q{http://cookingandcoding.com/gdata4ruby/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gdata4ruby}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A full featured wrapper for interacting with the base Google Data API}
  s.test_files = ["test/unit.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
