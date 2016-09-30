class RoomsController < ApplicationController
# load_and_authorize_resource
  def show
  	@messages = Message.all
  end

  def index
  	@messages = Message.all
  end
end
