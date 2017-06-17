class ManuscriptController < ApplicationController
  def index
    @manuscript = Manuscript.find_manuscript(params[:code], params[:last_name])

    if @manuscript
      render :show
    else
      error_redirect
    end
  end

  def error_redirect
    flash[:errors] = "Manuscript not found."
    lname = params[:last_name]
    code = params[:code]

    if lname && lname.length <= 1
      flash[:errors] = "Last name search parameter must be at least 2 characters long."
    end
    if code && code.length === 0
      if flash[:errors] === "Manuscript not found."
        flash[:errors] = " Code cannot be blank."
      else
        flash[:errors] << " Code cannot be blank."
      end
    end

    redirect_to inquiry_index_url(lname: lname, code: code)
  end
end
