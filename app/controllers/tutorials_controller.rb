class TutorialsController < ApplicationController
  before_action :authorize_specialist_or_retailer, only: [:create]

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user = current_user

    if @tutorial.save
      render json: @tutorial, status: :created
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  private

  def current_user
    User.find(params[:user_id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:name, :description, :url)
  end

  def authorize_specialist_or_retailer
    unless current_user.admin?
      render json: { error: 'Only admins can create tutorials' }, status: :forbidden
    end
  end
end
