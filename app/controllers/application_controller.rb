class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :gethost
  
  def gethost
      @hostname = ENV['HOSTNAME'] || 'Anonymous'
  end
end
