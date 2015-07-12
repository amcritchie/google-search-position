class SearchPositionController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @search = Google::Search::Web.new(:query => 'cyvasse')
  end
end