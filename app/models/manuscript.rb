class Manuscript
  include Mongoid::Document

  embeds_many :authors

  field :code, type: String
  field :title, type: String
  field :status, type: String
  field :status_date, type: Date

  def self.find_manuscript(code, last_name)
    Mongoid.raise_not_found_error = false
    manuscript = Manuscript.find_by(code: code)

    if manuscript
      last_name = last_name.strip.downcase
      authors = manuscript.authors.map{ |auth| auth.last_name.downcase }

      found_author = false
      if last_name.length > 1
        authors[0...3].each do |ln|
          if ln.length < last_name.length
            next
          elsif last_name.length > 2
            if ln.index(last_name) === 0
              found_author = true
              break
            end
          elsif ln === last_name
            found_author = true
            break
          end
        end
      end
    end

    found_author ? manuscript : nil
  end
end
