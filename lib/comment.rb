module Mongoid_Commentable
  module Comment
    extend ActiveSupport::Concern

    included do |base|
      base.attr_accessible :path,:parent
      base.field :path, :type => String, :default => ""
      base.field :parent, :type => String
      base.field :deleted_at, :type => Time
      base.embedded_in :commentable, :polymorphic => true, :inverse_of => :comments
    end

    def level
      path.count('.')
    end

    def remove
      self.update_attribute(:deleted_at, Time.now)
    end

    def restore
      self.update_attribute(:deleted_at, nil)
    end

    def deleted?
      !!self.deleted_at
    end
    
  end
end
