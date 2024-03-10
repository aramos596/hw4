class EntriesController < ApplicationController

  def new
    @entry = Entry.new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
   # @entry = Entry.new
    if @user !=nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry.uploaded_image.attach(params["uploaded_image"])
      @entry["user_id"] = @user["id"]
      @entry.save
    end
    redirect_to "/places/#{params["place_id"]}"
  end

end
