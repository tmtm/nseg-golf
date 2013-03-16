class PostsController < ApplicationController
  before_filter :only => [:show, :edit, :update, :destroy] do
    post = Post.find(params[:id])
    unless @admin || post.user.id == @uid
      render :status => :forbidden, :text => "Forbidden"
    end
  end

  # GET /posts
  def index
    @posts = Post.all.sort_by(&:size)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new
    @post.user = @user
    @post.language = params[:post][:language]
    code = params[:post][:code]
    @post.code = code.read
    @post.size = @post.code.bytesize
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])
    lang, code = params[:post].values_at(:language, :code)
    @post.language = lang if lang
    if code
      @post.code = code.read
      @post.size = @post.code.bytesize
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end
end
