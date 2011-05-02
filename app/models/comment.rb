class Comment
  include Mongoid::Document
  attr_accessible :text, :author, :path, :parent
  field :text, :type => String
  field :author, :type => String
  field :path, :type => String, :default => ""
  field :deleted, :type => Boolean, :default => false
  field :parent, :type => String
  embedded_in :commentable, :polymorphic => true
 
  def level
    path.count('.')
  end

  

 end
