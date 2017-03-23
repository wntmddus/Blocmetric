class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_application, except: [:new, :index, :create]
  def index
    @registered_applications = current_user.registered_applications
  end
  def create
    @registered_application = current_user.registered_applications.new(registered_application_params)
    if @registered_application.save
      flash[:message] = "#{@registered_application.name} created successfully"
      redirect_to registered_applications_path
    else
      render :new
    end
  end

  def show
    @registered_application = current_user.registered_applications.find(params[:id])
    @events = @registered_application.events.order(:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
  end

  def update
    @registered_application.assign_attributes(registered_application_params)
    if @registered_application.save
      flash[:notice] = "Application was updated"
      redirect_to [@registered_application.user, @registered_application]
    else
      flash.now[:alert] = "There was an error saving your applicaiton"
      render :edit
    end
  end
  def destroy
    if @registered_application.destroy
       flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
       redirect_to @registered_application.topic
     else
       flash.now[:alert] = "There was an error deleting the application."
       render :show
     end
  end

  private
  def find_application
    @registered_application = current_user.registered_applications.find(params[:id])
  end

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
