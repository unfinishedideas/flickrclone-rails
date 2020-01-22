class MembersController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @members = Member.all
    render :index
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:notice] = "You've successfully signed up!"
      session[:member_id] = @member.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def edit
    @member = Member.find(params[:id])
    render :edit
  end

  def show
    @member = Member.find(params[:id])
    render :show
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to members_path
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end

  private

  def member_params
    params.require(:member).permit(:email, :password, :password_confirmation)
  end
end
