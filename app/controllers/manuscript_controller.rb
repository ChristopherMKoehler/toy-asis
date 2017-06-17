class ManuscriptController < ApplicationController
  def show
    Mongoid.raise_not_found_error = false
    @manuscript = Manuscript.find(params[:id])

    if @manuscript
      render :show
    else
      redirect_to new_inquiry_url
    end
  end
end
