# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongoid_commentable"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Max Golovnia"]
  s.date = "2013-01-12"
  s.description = "Mongoid_commentable provides methods to create commentable documents"
  s.email = "mgolovnia@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/comments_controller.rb",
    "lib/comment.rb",
    "lib/generators/mongoid_commentable/install_generator.rb",
    "lib/generators/templates/models/comment.rb",
    "lib/generators/templates/views/comments/_form.html.erb",
    "lib/generators/templates/views/comments/edit.html.erb",
    "lib/generators/templates/views/comments/index.html.erb",
    "lib/generators/templates/views/comments/new.html.erb",
    "lib/generators/templates/views/comments/show.html.erb",
    "lib/mongoid/commentable.rb",
    "lib/mongoid_commentable.rb",
    "mongoid_commentable.gemspec",
    "spec/models/comment.rb",
    "spec/models/commentable_model.rb",
    "spec/mongoid/commentable_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/mgolovnia/mongoid_commentable"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Comments for Mongoid documents"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, [">= 2.2"])
      s.add_runtime_dependency(%q<bson_ext>, [">= 1.3"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<mongoid>, [">= 2.2"])
      s.add_dependency(%q<bson_ext>, [">= 1.3"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<mongoid>, [">= 2.2"])
    s.add_dependency(%q<bson_ext>, [">= 1.3"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

