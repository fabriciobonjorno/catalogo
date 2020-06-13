# frozen_string_literal: true

class Dashboard::UsersController < DashboardController
  before_action :set_user, only: %i[edit update destroy]
  before_action :allow_without_password, only: [:update]
  def index
    @users = User.order(:username).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to dashboard_users_path, notice: "O usuário #{@user.username} cadastrado com sucesso"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(params_user)
      redirect_to dashboard_users_path, notice: "O usuário #{@user.username} atualizado com sucesso"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to dashboard_users_path, notice: "O usuário #{@user.username} excluido com sucesso"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  # remove o input da validação do devise
  def allow_without_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
