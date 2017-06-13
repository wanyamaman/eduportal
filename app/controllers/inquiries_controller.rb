class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.new(secure_params)
    if @inquiry.valid?
      flash[:notice] = "Thank you #{@inquiry.name}!
                        We will be in touch shortly."
      @inquiry.send_mail
      redirect_to root_path
    end
  end

  private

    def secure_params
      params.require(:inquiry).permit(:name, :email, :subject, :message)
    end
end
