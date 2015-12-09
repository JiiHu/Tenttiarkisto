class FrontpageController < ApplicationController

  def index
    @header = "Home"
    @filterrific = initialize_filterrific(
      Subject,
      params[:filterrific]
    ) or return
    @subjects = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

end
