class ManuscriptController < ApplicationController
  def show
    @manuscript = Manuscript.find(params[:id])

    if @manuscript
      render :show
    else
      redirect_to new_inquiry_url
    end
  end
end
