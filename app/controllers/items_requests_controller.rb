class ItemsRequestsController < ApplicationController
  def index
    @user = current_user
    @request = Request.find(params[:request_id])
    @items_request = ItemsRequest.new
    @registered_items_requests = ItemsRequest.where(request: @request)
  end

  def show
  end

  def create
    @items_request = ItemsRequest.new(strong_params_items_requests)
    @items_request.request = Request.find(params[:request_id]) ##########
    if @items_request.save!
      redirect_to user_request_items_requests_path(current_user, params[:request_id])
    end
  end

  def new
  end

  def edit
  end

  def delete
  end

  def strong_params_items_requests
    params.require(:items_request).permit(:item_id, :quantity, :status, :request_id, :address)
  end
end
