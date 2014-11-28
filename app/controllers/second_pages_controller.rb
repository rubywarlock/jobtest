class SecondPagesController < ApplicationController
	include ApplicationHelper

  def index
  end

  def show
		@show_second_page = SecondPage.find(params[:id])
		@first_page = FirstPage.find_by(:id => @show_second_page.first_page_id)
  end

  def edit
	  @edit_second_page = SecondPage.find(params[:id])
  end

	def update
		@update = SecondPage.find(params[:id])
		if @update.update_attributes(params.require(:second_page).permit(:title, :text))
			redirect_to @update, notice: 'Second Page was successfully updated.'
		else
			render action: "edit"
		end
	end

  def new
		@new_second_page = SecondPage.new
		@first_page_id = params[:first_page_id]
  end

  def create
	  @create_second_page = SecondPage.new(params.require(:second_page).permit(:first_page_id, :title, :text))
	  @create_second_page.text = replacer(@create_second_page.text)
		if @create_second_page.save
			redirect_to first_page_path(@create_second_page.first_page_id)
		else
			render "second_pages/new"
		end
  end

  def destroy
  end
end
