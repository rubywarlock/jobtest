class ContentsController < ApplicationController
	include ApplicationHelper

  def show
	  @show_content = Content.find(params[:id])
  end

  def new
	  @new_content = Content.new
	  @third_page_id = params[:third_page]
  end

  def edit
	  @edit_content = Content.find(params[:id])
  end

	def update
		@update = Content.find(params[:id])
		if @update.update_attributes(params.require(:content).permit(:title, :text))
			redirect_to @update, notice: 'Content was successfully updated.'
		else
			render action: "edit"
		end
	end

  def create
	  @create_content = Content.new(params.require(:content).permit(:third_page_id, :title, :text))
	  @create_content.text = replacer(@create_content.text)
	  if @create_content.save
		  redirect_to @create_content
	  else
			redirect_to third_page_path(@create_content.third_page_id)
	  end
  end

  def destroy
  end

end
