module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user_from_session_cookie
    before_action :require_authentication
    helper_method :current_user_is_authenticated?, :current_user
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :set_current_user_from_session_cookie, **options
      skip_before_action :require_authentication, **options
    end
  end

  private

  def current_user_is_authenticated?
    Current.user.present?
  end

  def current_user
    Current.user
  end

  def require_authentication
    request_authentication unless current_user_is_authenticated?
  end

  def set_current_user_from_session_cookie
    session_record = find_session_by_cookie
    if session_record
      Current.session = session_record
      Current.user = session_record.user
    else
      Current.user = nil
      Current.session = nil
    end
  end

  def find_session_by_cookie
    Session.includes(:user).find_by(id: cookies.signed[:session_id]) if cookies.signed[:session_id]
  end

  def request_authentication
    session[:return_to_after_authenticating] = request.url
    redirect_to new_session_path, alert: "You must be logged in to access this page."
  end

  def after_authentication_url
    session.delete(:return_to_after_authenticating) || dashboard_path
  end

  def start_new_session_for(user)
    session_record = user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip)

    Current.session = session_record
    Current.user = user

    cookies.signed.permanent[:session_id] = { value: session_record.id, httponly: true, same_site: :lax }

    session_record
  end

  def terminate_session
    Current.session&.destroy
    cookies.delete(:session_id)

    Current.session = nil
    Current.user = nil
  end
end
