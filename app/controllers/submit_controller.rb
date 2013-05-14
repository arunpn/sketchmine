class SubmitController < ApplicationController

  def index
  	@message = Message.new
  end

  def send_email_form
  	@message = Message.new(params[:message])
  	
  	if @message.valid?
  		ContactForm.email_form(@message).deliver
  		redirect_to root_path, notice: "Your .sketch file has been submited. It will be reviewed and posted very soon!"
  	else
  		flash.now.alert = "Submit didn't work. Please check your entries."
  		render :index
  	end

  end
end

