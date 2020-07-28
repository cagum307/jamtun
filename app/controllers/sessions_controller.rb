class SessionsController < ApplicationController
  def new
  end

  def create
    adminid = params[:session][:adminid]
    password = params[:session][:password]
    if login(adminid, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to :root
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
  end

  private

  def login(adminid, password)
    @admin = Admin.find_by(adminid: adminid)
    if @admin && @admin.authenticate(password)
      # ログイン成功
      session[:admin_id] = @admin.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
