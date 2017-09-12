class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :gethot
  
  def gethost
      @hostname = ENV['HOSTNAME'] || 'Anynymous'
  end
end
