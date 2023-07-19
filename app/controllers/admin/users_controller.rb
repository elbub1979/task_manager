class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[show edit destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.order(:type).order(:id).page(params[:page]).per(params[:per_page])
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url
    else
      render :new_admin_user_url
    end
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :type)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
