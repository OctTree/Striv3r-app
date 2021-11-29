class Api::V1::RolesController < ApplicationController

  include AuthorisationConcerns
  include AuthorisationResponseConcerns

  before_action :authorize_request, raise: false
  before_action :set_role, only: [:update, :destroy, :show]

  def index
    @roles = Role.all
    render layout: 'layouts/api'
  end

  def show
    render layout: 'layouts/api'
  end

  def create
    @role = Role.new(roles_params)

    if @role.save
      @message = "Successfully created"
      render layout: 'layouts/api'
    else
      error_json_response @role.errors.full_messages, :bad_request
    end
  end

  def update
    if @role.update(roles_params)
      @message = "Successfully updated"
      render layout: 'layouts/api'
    else
      error_json_response @role.errors.full_messages, :bad_request
    end
  end

  def destroy
    if @role.destroy
      success_json_response({message: "Destroyed successfully."})
    else
      error_json_response @role.errors.full_messages, :bad_request
    end
  end

  private

  def roles_params
    params.require(:role).permit(:name)
  end

  def set_role
    @role = Role.find(params[:id])
  end
end