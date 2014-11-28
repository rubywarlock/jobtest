class ThirdPagesController < ApplicationController
	include ApplicationHelper

  def index
  end

  def show
		@show_third_page = ThirdPage.find(params[:id])
		@second_page = SecondPage.find_by(:id => @show_third_page.second_page_id)
  end

  def edit
	  @edit_third_page = ThirdPage.find(params[:id])
  end

	def update
		@update = ThirdPage.find(params[:id])
		if @update.update_attributes(params.require(:third_page).permit(:title, :text))
			redirect_to @update, notice: 'Third Page was successfully updated.'
		else
			render action: "edit"
		end
	end

  def new
	  @new_third_page = ThirdPage.new
	  @second_page_id = params[:second_page]
  end

  def create
		@create_third_page = ThirdPage.new(params.require(:third_page).permit(:second_page_id, :title, :text))
		@create_third_page.text = replacer(@create_third_page.text)
		if @create_third_page.save
			redirect_to second_page_path(@create_third_page.second_page.first_page_id,@create_third_page.second_page_id)
		else
			render "third_pages/new"
		end
  end

  def destroy
  end
end
