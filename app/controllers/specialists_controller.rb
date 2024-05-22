class SpecialistsController < ApplicationController
  def index
    @specialists = Specialist.all
    render json: @specialists, except: [:created_at, :updated_at]
  end
end
