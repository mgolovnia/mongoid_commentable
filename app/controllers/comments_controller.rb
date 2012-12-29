class CommentsController < ActionController::Base
  
  prepend_before_filter :get_model
  before_filter :get_comment, :only => [:show, :edit, :update]

  respond_to :html
  
  def index
    @comments = @model.comments
    respond_with([@model,@comments])
  end

  def show
    respond_with([@model,@comment])
  end

  def new
    respond_with([@model,@comment = Comment.new(:parent => params[:parent])])
  end

  def edit
    respond_with([@model,@comment])
  end

  def create
    @comment = @model.create_comment!(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:error] = 'Comment wasn\'t created.'
    end
    respond_with(@model)
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
    else
      flash[:error] = 'Comment wasn\'t deleted.'
    end
    respond_with([@model,@comment], :location => @model)
  end

  def destroy
    @model.remove(params[:comment])
    respond_with(@model)
  end

  private

  def get_model
    @model = params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.camelize.find(value)
      end
    end
  end
  
  def get_comment
    @comment = @model.comments.find(params[:id])
  end

end
