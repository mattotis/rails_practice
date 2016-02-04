class SayController < ApplicationController
  #< ApplicationController sets inheritance
  def hello
    @current_time = Time.now
  end

  def goodbye
  end
end
