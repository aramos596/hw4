class PlacesController < ApplicationController

  def index
    @places = Place.where({  "user_id" => @current_user["id"] })
  end

  def show
    @places = Place.where({ "id" => params["id"], "user_id" => @current_user["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    
  end

  def new
  end

  def create
    #@user = User.find_by({ "id" => session["user_id"] })
    if @current_user !=nil
      @place = Place.new
      @place["name"] = params["name"]
      @place["user_id"] = @current_user["id"]
      @place.save
    end
    redirect_to "/places"
  end


end
