class BroadcastsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
  # before_action :authenticate_member!

  def new
    @member = Member.find(params[:member_id])
    @broadcast = @member.broadcasts.new
    render :new
  end

  def create
    @member = Member.find(params[:member_id])
    @broadcast = @member.broadcasts.new(broadcast_params)
    if @broadcast.save
      redirect_to member_path(@member)
    else
      render :new
    end
  end

  def show
    @member = Member.find(params[:member_id])
    @broadcast = Broadcast.find(params[:id])
    render :show
  end

  def edit
    @member = Member.find(params[:member_id])
    @broadcast = Broadcast.find(params[:id])
    render :edit
  end

  def update
    @broadcast = Broadcast.find(params[:id])
    if @broadcast.update(broadcast_params)
      redirect_to member_path(@broadcast.member)
    else
      render :edit
    end
  end

  def destroy
    @broadcast = Broadcast.find(params[:id])
    @broadcast.destroy
    redirect_to member_path(@broadcast.member)
  end
  def broadcast_params
    params.require(:broadcast).permit(:description, :broadcast_image)
  end
end
