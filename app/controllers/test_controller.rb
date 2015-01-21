class TestController < ApplicationController
  def index
    @farmers = Farmer.all
  end
end
