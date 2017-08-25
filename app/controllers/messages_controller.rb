class MessagesController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @request_user = @request.user
    @message = Message.new(strong_params_message)
    @message.user = current_user
    @message.request = @request

    if @message.save
      respond_to do |format|
        format.html { redirect_to user_request_path(@request.user_id, @request.id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'messages/show' }
        format.js
      end
    end
  end

  private

  def strong_params_message
    params.require(:message).permit(:user_id, :request_id, :text)
  end

end
