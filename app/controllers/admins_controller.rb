class AdminsController < ApplicationController
  before_action :require_admin_logged_in#, only: [:index, :show]
  
  def index
    @posts = Post.all
  end

end