class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_super_admin

  def index

  end

end
