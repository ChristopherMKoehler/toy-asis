class InquiryController < ApplicationController
  def index
    @errors = params[:errors]
    @lname = params[:lname]
    @code = params[:code]
    render :index
  end
end
