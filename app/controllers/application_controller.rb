class ApplicationController < ActionController::Base
  include SessionsHelper
  include PlayersHelper

  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from Exception, with: :render_500
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end
  
  def after_sign_in_path_for(resource)
    user_path(resource.public_uid)
  end

  def format_date(year, month, day)
      return Date.new(year.to_i, month.to_i, day.to_i) if Date.valid_date?(year.to_i, month.to_i, day.to_i)
      return Date.new(1899, 12, 31)
  end
end
