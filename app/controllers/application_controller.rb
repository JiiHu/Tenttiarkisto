class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_path
  helper_method :user_is_super_admin
  helper_method :current_user_can_manage_course

  def current_path
    request.env['PATH_INFO']
  end


  def current_user_can_manage_course(course)
    return false unless current_user
    return true if user_is_super_admin

    return true if course.can_user_manage(current_user)

    return false
  end


  def user_is_super_admin
    current_user && current_user.is_super_admin
  end

  def validate_super_admin
    return redirect_to root_path unless current_user.is_super_admin
  end

end
