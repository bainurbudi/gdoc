# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{turn}
  s.version = "0.8.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pease"]
  s.date = %q{2011-10-10 00:00:00.000000000Z}
  s.default_executable = %q{turn}
  s.description = %q{}
  s.email = %q{tim.pease@gmail.com}
  s.executables = ["turn"]
  s.extra_rdoc_files = ["History.txt", "NOTICE.txt", "Release.txt", "Version.txt", "bin/turn", "license/GPLv2.txt", "license/MIT-LICENSE.txt", "license/RUBY-LICENSE.txt"]
  s.files = [".travis.yml", "Gemfile", "History.txt", "NOTICE.txt", "README.md", "Rakefile", "Release.txt", "Version.txt", "bin/turn", "demo/test_autorun_minitest.rb", "demo/test_autorun_testunit.rb", "demo/test_counts.rb", "demo/test_sample.rb", "demo/test_sample2.rb", "lib/turn.rb", "lib/turn/autoload.rb", "lib/turn/autorun/minitest.rb", "lib/turn/autorun/minitest0.rb", "lib/turn/autorun/testunit.rb", "lib/turn/autorun/testunit0.rb", "lib/turn/bin.rb", "lib/turn/colorize.rb", "lib/turn/command.rb", "lib/turn/components/case.rb", "lib/turn/components/method.rb", "lib/turn/components/suite.rb", "lib/turn/controller.rb", "lib/turn/core_ext.rb", "lib/turn/reporter.rb", "lib/turn/reporters/cue_reporter.rb", "lib/turn/reporters/dot_reporter.rb", "lib/turn/reporters/marshal_reporter.rb", "lib/turn/reporters/outline_reporter.rb", "lib/turn/reporters/pretty_reporter.rb", "lib/turn/reporters/progress_reporter.rb", "lib/turn/runners/crossrunner.rb", "lib/turn/runners/isorunner.rb", "lib/turn/runners/loadrunner.rb", "lib/turn/runners/minirunner.rb", "lib/turn/runners/solorunner.rb", "lib/turn/runners/testrunner.rb", "lib/turn/version.rb", "license/GPLv2.txt", "license/MIT-LICENSE.txt", "license/RUBY-LICENSE.txt", "test/helper.rb", "test/runner", "test/test_framework.rb", "test/test_reporters.rb", "test/test_runners.rb", "turn.gemspec"]
  s.homepage = %q{http://gemcutter.org/gems/turn}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{turn}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Test::Unit Reporter (New) -- new output format for Test::Unit}
  s.test_files = ["test/test_framework.rb", "test/test_reporters.rb", "test/test_runners.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>, [">= 0"])
      s.add_development_dependency(%q<bones-git>, [">= 1.2.4"])
      s.add_development_dependency(%q<bones>, [">= 3.7.1"])
    else
      s.add_dependency(%q<ansi>, [">= 0"])
      s.add_dependency(%q<bones-git>, [">= 1.2.4"])
      s.add_dependency(%q<bones>, [">= 3.7.1"])
    end
  else
    s.add_dependency(%q<ansi>, [">= 0"])
    s.add_dependency(%q<bones-git>, [">= 1.2.4"])
    s.add_dependency(%q<bones>, [">= 3.7.1"])
  end
end
