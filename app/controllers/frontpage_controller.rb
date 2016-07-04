class FrontpageController < ApplicationController

  def index
    @header = "Home"
    @filterrific = initialize_filterrific(
      Subject,
      params[:filterrific],
      :persistence_id => false
    ) or return
    @subjects = @filterrific.find.page(params[:page]).order("subjects.name asc")

    respond_to do |format|
      format.html
      format.js
    end
  end

end
