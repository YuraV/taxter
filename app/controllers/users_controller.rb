class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :user_find, except: [:index, :create, :new]


  respond_to :html

  def index
    @users = User.all
  end

  def new

  end

  def create
    @user = User.create(params[:user])
    redirect_to @user
  end

  def edit

  end

  def update
    @user.update_attributes(params[:user])
    respond_with @user
  end

  def show
  end


  def destroy
    if @user != current_user
      @user.destroy
    else
      redirect_to :back, alert: "You are still signed in"
    end
  end

  private
  def user_find
    @user = User.find(params[:id])
  end

end
