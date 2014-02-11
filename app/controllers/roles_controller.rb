class RolesController < ApplicationController

  load_and_authorize_resource

  respond_to :html

  before_filter :find_role, except: [:index, :create, :new]

  def index
    @roles = Role.all
  end

  def new

  end

  def create
    @role = Role.create(params[:role])
    redirect_to roles_path
  end

  def edit

  end

  def update
    @role.update_attributes(params[:role])
    redirect_to roles_path
  end

private
  def find_role
    @role = Role.find(params[:id])
  end

end
