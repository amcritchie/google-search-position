class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def urls_match(target_url, search_url)
    match = false
    url_without_prefix = target_url.sub('http://','').sub('www.','')
    if search_url.include? url_without_prefix
      match = true
    end
    match
  end
end
