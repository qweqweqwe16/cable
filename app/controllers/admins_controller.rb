class AdminsController < ApplicationController
	#load_and_authorize_resource
  before_action :authenticate_user!
  before_filter :verify_is_admin

  def index
    # if current_user.admin?
    #    redirect_back(fallback_location: root_path)
    #  end
    @messages = Message.all
  end

  def show
  end

  def change_state
    message = Message.find(params[:id])
    message.send(params[:event])
    redirect_back(fallback_location: root_path)
  end

end


private

def verify_is_admin
  (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
end
