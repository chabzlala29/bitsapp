class ActivitiesController < InheritedResources::Base
  before_action :auth_user!

  def index
    @activities = current_user.activities
  end

  def create
    @activity = current_user.activities.new(permitted_params[:activity])
    if @activity.save
      redirect_to @activity, notice: "Successfully Added Record!"
    else
      render :new
    end
  end

  private
  def permitted_params
    params.permit(activity: [:name, :description])
  end
end
