class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
	  if !params[:users].nil?
		  from = params[:users][:from]
		  to   = params[:users][:to]

		  p = []

		  from.each do |f|
			  if !f[1].empty?
				  # ниже делается строка запроса для выборки по диапозону или с простым условием
				  # вместо вложенных IF решил записать это в одну строку
				  to[f[0]].empty? ? p.push("#{f[0]} = #{f[1]}") : to[f[0]] >= f[1] ? p.push("#{f[0]} BETWEEN #{f[1]} and #{to[f[0]]}") : "no"
			  end
		  end

		  p = p.join(" AND ")

      @users = User.where(p).order("age desc")
	  else
		  @users = User.all
	  end
  end

  def find

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:age, :pay, :stature, :weigh)
    end
end
