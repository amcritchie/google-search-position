class SearchPositionController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    search = params[:search]
    url = params[:url]
    @results == nil
    if !url.nil? && !search.nil?
      if search.length > 0 && url.length > 0
        @results = Google::Search::Web.new(:query => params[:search])
        @url_position = 'Not in first 64 results'
        @results.dup.each_with_index do |result, index|
          if urls_match(url, result.uri)
            return @url_position = index + 1
          end
        end
      end
    end
  end

  def about
  end
end