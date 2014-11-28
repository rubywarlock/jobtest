class FirstPagesController < ApplicationController
	include ApplicationHelper

  def index
  end

  def show
	  @show_first_page = FirstPage.find(params[:id])
  end

  def edit
	  @edit_first_page = FirstPage.find(params[:id])
  end

	def update
		@update = FirstPage.find(params[:id])
		if @update.update_attributes(params.require(:first_page).permit(:title, :text))
			redirect_to @update, notice: 'First Page was successfully updated.'
		else
			render action: "edit"
		end
	end

  def new
	  @new_first_page = FirstPage.new
  end

  def create
	  @creat_first_page = FirstPage.new(first_page_params)
	  @creat_first_page.text = replacer(@creat_first_page.text)
	  if @creat_first_page.save
		  redirect_to @creat_first_page
	  else
		  render "first_pages/new"
	  end
  end

  def destroy
  end

	private
	def first_page_params
		params.require(:first_page).permit(:title, :text)
	end
end
