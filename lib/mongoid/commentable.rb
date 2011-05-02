module Mongoid::Commentable
  extend ActiveSupport::Concern

  included do |base|
    base.embeds_many :comments, :as => :commentable
    base.field :comments_count, :type => Integer, :default => 0
    base.index [['comments', Mongo::ASCENDING]]
  end
    
  module ClassMethods
    
    def commentable?
      true
    end
  
  end

    
  def create_comment!(params)
    comment = comments.create!(params)
    comment.path = comment.parent ? comments.find(comment.parent).path + '.' + comment.id.to_s : "root."+comment.id.to_s
    self.inc(:comments_count,1)
    comment
  end

  def comments_list(sort=:asc)
    if Comment.respond_to?(sort)
      comments.send(sort,:path)
    else
      raise ArgumentError, "Wrong argument!"
    end
  end

  def branch_for(comment_id)
    comments.select{|i| i.path =~ Regexp.new('^' + comments.find(comment_id).path)}
  end

  def mark_comment_deleted(comment_id)
    comments.find(comment_id).deleted = true
    self.inc(:comments_count,-1)
  end

end
