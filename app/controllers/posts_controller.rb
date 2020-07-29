class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(4)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'NEWS が正常に投稿されました'
      redirect_to admins_path
    else
      flash.now[:danger] = 'NEWS が投稿されませんでした'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'NEWS は正常に更新されました'
      redirect_to admins_url
    else
      flash.now[:danger] = 'NEWS は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:success] = 'NEWS は正常に削除されました'
    redirect_to admins_url
  end

  private

  # Strong Parameter
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
