require 'tmpdir'
module Mongoid_Commentable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates mongoid_commentable views and model for your application."
      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"
      def copy_views
        directory "views/comments", "app/views/#{scope || :comments}"
      end

      def copy_model
        template "models/comment.rb", "app/models/comment.rb"
      end

    end
  end
end

