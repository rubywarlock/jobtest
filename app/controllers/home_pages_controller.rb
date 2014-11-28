class HomePagesController < ApplicationController
  def index
	  @firstpage = FirstPage.all
  end

  def admin
  end
end