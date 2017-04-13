module Admin
  class ManuscriptsController < ApplicationController
    def index
      @manuscripts = Manuscript.all
    end
  end
end