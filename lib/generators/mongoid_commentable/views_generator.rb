require 'tmpdir'
module Mongoid_Commentable
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "Copies all mongoid_commentable views to your application."
      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"
      def copy_views
        directory "comments", "app/views/#{scope || :comments}"
      end
    end
  end
end

