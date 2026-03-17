class EntriesController < ApplicationController
  
  def index
    # filter entries by logged-in user
      # @entries = Entry.where({ "user_id" => session["user_id"] })
       @entries = Entry.where({ "user_id" => session["user_id"], "place_id" => params["place_id"] })
  end
  
  def show
  @entry = Entry.find_by({ "id" => params["id"], "user_id" => session["user_id"] })
  end
  
  def new

  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.save

    if params["uploaded_image"].present?
      @entry.uploaded_image.attach(params["uploaded_image"])
    end

    redirect_to "/places/#{@entry["place_id"]}"
  end
end
