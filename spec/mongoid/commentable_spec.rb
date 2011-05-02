require 'spec_helper'
class TestModel
  include Mongoid::Document
  include Mongoid::Commentable
end
describe 'Make commentable' do
  
   let(:test_model){TestModel.create!}
  

  it 'should be commentable' do
    test_model.class.commentable?.should == true
  end

  it 'should allow to add a comment' do
    comment = test_model.create_comment!(:author => 'Test author', :text => 'Hello, World!')
    comment.author.should == 'Test author'
    comment.text.should == 'Hello, World!'
    comment.path.should == "root.#{comment.id.to_s}"
    comment.deleted.should == false
    test_model.comments_count == 1
  end

  it 'should allow to add a reply to a comment' do
    comment = test_model.create_comment!(:author => 'Author', :text => 'Parent')
    reply = test_model.create_comment!(:author => 'Author2', :text => 'Reply', :parent => comment.id.to_s)
    test_model.comments.find(reply.id).path.should == "#{comment.path}.#{reply.id.to_s}"
  end

  it 'should mark comment as deleted' do
    comment = test_model.create_comment!(:author => 'Author', :text => 'Parent')
    test_model.comments_count == 1
    test_model.mark_comment_deleted(comment.id)
    test_model.comments.find(comment.id).deleted.should == true
    test_model.comments_count == 0
  end

  it 'should return a branch of comments' do
    parent1 = test_model.create_comment!(:author => 'Test author', :text => 'Parent1')
    child1 = test_model.create_comment!(:author => 'Test author', :text => 'Child1', :parent => parent1.id.to_s)
    child2 = test_model.create_comment!(:author => 'Test author', :text => 'Parent1', :parent => child1.id.to_s)
    parent2 = test_model.create_comment!(:author => 'Test author', :text => 'Parent2')
    branch = test_model.branch_for(parent1.id)
    branch.should == [parent1,child1,child2]
  end

  it 'should return wrong argument error' do
    expect{test_model.comments_list(:wrong_argument)}.to raise_error ArgumentError
  end



end
