# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gdocs4ruby}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Reich"]
  s.date = %q{2010-05-15}
  s.description = %q{GDocs4Ruby is a full featured wrapper for version 2.0 of the Google Documents API (aka DocList).  GDocs4Ruby provides the ability to create, update and delete google documents, metadata and content.  The gem also includes support for folders, modifying permissions for documents via ACL feeds, and much more.}
  s.email = %q{mike@seabourneconsulting.com}
  s.files = ["README", "CHANGELOG", "lib/gdocs4ruby.rb", "lib/gdocs4ruby/service.rb", "lib/gdocs4ruby/folder.rb", "lib/gdocs4ruby/document.rb", "lib/gdocs4ruby/base_object.rb", "lib/gdocs4ruby/spreadsheet.rb", "lib/gdocs4ruby/presentation.rb", "test/unit.rb"]
  s.homepage = %q{http://gdocs4ruby.rubyforge.org/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gdocs4ruby}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A full featured wrapper for interacting with the Google Docs API}
  s.test_files = ["test/unit.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gdata4ruby>, [">= 0.1.1"])
    else
      s.add_dependency(%q<gdata4ruby>, [">= 0.1.1"])
    end
  else
    s.add_dependency(%q<gdata4ruby>, [">= 0.1.1"])
  end
end
