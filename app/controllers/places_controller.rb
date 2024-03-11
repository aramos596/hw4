class PlacesController < ApplicationController

  def index
    @places = Place.all 
  end

  def show
    @places = Place.find_by({ "id" => params["id"]})
    @entries = Entry.where({ "place_id" => params["id"] }) #, "user_id" => @current_user["id"]
    
  end

  def new
  end

  def create
    #@user = User.find_by({ "id" => session["user_id"] })
    if @current_user !=nil
      @place = Place.new
      @place["name"] = params["name"]
     # @place["user_id"] = @current_user["id"]
      @place.save
      redirect_to "/places"
    end

  end


end
