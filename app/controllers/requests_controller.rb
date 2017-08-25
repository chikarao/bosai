class RequestsController < ApplicationController
  def index
    #raise
    if params[:lat]
      user = current_user
      user.latitude = params[:lat]
      user.longitude = params[:lng]
      user.save!
      #To Do: Write
    end

    #######################################
    if current_user.latitude == nil && params[:fail].to_i != 1
      redirect_to requests_geolocate_path ## skipped for now
    end
    ########################################
    @requests = Request.where(user: current_user)
    @near_shelters = EvacuationPoint.near([current_user.latitude, current_user.longitude], 5)

    ##@helping_requests = Request.joins(:messages).where(messages: {user: current_user})
    @helping_requests = Request.joins(:messages).where("messages.user_id = ? AND requests.user_id != ?", current_user.id, current_user.id )

  end

  def geolocate

  end

  def show
    @request = Request.find(params[:id])
    @request_user = User.find(params[:user_id])
    @past_messags = @request.messages
    @message = Message.new
  end

  def list
   ## 0726 by Kouhei
   ## In order to use parameters in view again, It can be used also in the view page.
   @radius = params[:radius]

   if @radius == "" || @radius == nil
     radius = 20  ## I set the default value (No explicit radious case) to 20 Km
   else
     radius = @radius
   end

   ## 0726 by Kouhei
   ## Below is code for map
   temp = ItemsRequest.joins(:request).where.not(requests: {latitude: nil} )

    if params[:address] == nil || params[:address] == "" || Request.near(params[:address], radius).first == nil
      ##&& Request.near(params[:address], @radius, select: "*") != nil
      @items_requests = temp
      #raise
    else
      nearby = Request.near(params[:address], radius, select: "*")
      @items_requests = temp.joins(:request).merge(nearby)
      #raise
    end

    ## 0726 by Kouhei
    ## Below code is not used now. For perfomance improvement, I coomennted out.
    # @hash = Gmaps4rails.build_markers(@requests) do |request, marker|
    #   marker.lat request.latitude
    #   marker.lng request.longitude
    #   marker.picture ActionController::Base.helpers.image_url('fire_image.png')
    #   # marker.infowindow render_to_string(partial: "/requests/map_box", locals: { request: request })
    #  end
  end

  def edit
  end

  def new
    @request = Request.new
    @request.items_requests.build
    @user = User.find(current_user)
  end

  def create
    @request = Request.new(strong_params_request)
    @request.user = current_user

    if @request.save!
      redirect_to user_request_path(current_user.id, @request.id)
    end

  end

  def update
    @request = Request.find(params[:id])
    @request.update(strong_params_request)
    redirect_to user_request_path(@request.user_id, @request.id)
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to user_requests_path(current_user)
  end

  private

  def strong_params_request
    params.require(:request).permit(:category, :address, :priority, :user_id, :longitude, :latitude, :text, :status, items_requests_attributes: [:id, :quantity, :item_id, :request_id, :status, :_destroy])
  end

end
