class HomeController < ApplicationController

  def about_us
    render json: { "msg": 'Welcome to my application' }
  end
  
end