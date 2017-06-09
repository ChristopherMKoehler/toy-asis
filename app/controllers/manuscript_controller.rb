class ManuscriptController < ApplicationController
  def index
    Mongoid.raise_not_found_error = false

    @manuscript = Manuscript.find_by(code: params[:code])

    if @manuscript
      last_name = params[:last_name].strip.downcase
      authors = @manuscript.authors.map{ |auth| auth.last_name.downcase }

      foundAuthor = false
      if last_name.length > 1
        authors[0...3].each do |ln|
          if ln.length < last_name.length
            next
          elsif last_name.length > 2
            if ln.index(last_name) === 0
              foundAuthor = true
              break
            end
          elsif ln === last_name
            foundAuthor = true
            break
          end
        end
      end

      if foundAuthor
        render :show
      else
        error_redirect
      end
    else
      error_redirect
    end
  end

  def error_redirect
    errors = "Manuscript not found."
    lname = params[:last_name]
    code = params[:code]

    if lname && lname.length <= 1
      errors = "Last name search parameter must be at least 2 characters long."
    end
    if code && code.length === 0
      if errors === "Manuscript not found."
        errors = " Code cannot be blank."
      else
        errors << " Code cannot be blank."
      end
    end

    redirect_to inquiry_index_url(errors: errors, lname: lname, code: code)
  end
end
