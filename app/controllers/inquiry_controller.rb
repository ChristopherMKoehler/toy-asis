class InquiryController < ApplicationController
  def new
    flash[:errors] = ""
    @errors = params[:errors]
    @lname = params[:last_name]
    @code = params[:code]

    if params[:submitted]
      @manuscript = Manuscript.find_manuscript(@code, @lname)
      if @manuscript
        redirect_to manuscript_url(@manuscript.id)
      else
        show_with_errors
      end
    else
      render :new
    end
  end

  def show_with_errors
    flash[:errors] = "Manuscript not found."
    @lname = params[:last_name]
    @code = params[:code]

    if @lname && @lname.length <= 1
      flash[:errors] = "Last name search parameter must be at least 2 characters long."
    end
    if @code && @code.length === 0
      if flash[:errors] === "Manuscript not found."
        flash[:errors] = " Code cannot be blank."
      else
        flash[:errors] << " Code cannot be blank."
      end
    end

    render :new
  end
end
