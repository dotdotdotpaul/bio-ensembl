# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bio-ensembl}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jan Aerts", "Francesco Strozzi"]
  s.date = %q{2011-01-18}
  s.description = %q{TODO: longer description of your gem}
  s.email = ["jan.aerts@gmail.com", "francesco.strozzi@gmail.com"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/bio-ensembl.rb",
    "test/helper.rb"
  ]
  s.homepage = %q{http://github.com/fstrozzi/bioruby-ensembl}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "test/ensembl_genomes/test_collection.rb",
    "test/ensembl_genomes/test_gene.rb",
    "test/ensembl_genomes/test_slice.rb",
    "test/ensembl_genomes/test_variation.rb",
    "test/helper.rb",
    "test/release_60/core/test_gene.rb",
    "test/release_60/core/test_project_human.rb",
    "test/release_60/core/test_slice.rb",
    "test/release_60/core/test_transcript.rb",
    "test/release_60/core/test_transform.rb",
    "test/release_60/variation/test_activerecord.rb",
    "test/release_60/variation/test_consequence.rb",
    "test/release_60/variation/test_variation.rb",
    "test/test_connection.rb",
    "test/test_releases.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<bio>, [">= 1.4.1"])
      s.add_development_dependency(%q<mysql>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 0"])
      s.add_runtime_dependency(%q<active_record>, [">= 3.0"])
      s.add_runtime_dependency(%q<bio>, ["> 1.4.1"])
      s.add_development_dependency(%q<active_record>, [">= 3.0"])
      s.add_development_dependency(%q<bio>, ["> 1.4.1"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<bio>, [">= 1.4.1"])
      s.add_dependency(%q<mysql>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<active_record>, [">= 3.0"])
      s.add_dependency(%q<bio>, ["> 1.4.1"])
      s.add_dependency(%q<active_record>, [">= 3.0"])
      s.add_dependency(%q<bio>, ["> 1.4.1"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<bio>, [">= 1.4.1"])
    s.add_dependency(%q<mysql>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<active_record>, [">= 3.0"])
    s.add_dependency(%q<bio>, ["> 1.4.1"])
    s.add_dependency(%q<active_record>, [">= 3.0"])
    s.add_dependency(%q<bio>, ["> 1.4.1"])
  end
end

