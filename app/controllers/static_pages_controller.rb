class StaticPagesController < ApplicationController
  def home
  end

  def help
  end


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "thang cong"
      redirect_to @user
    else
      render 'new'
    end
end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
