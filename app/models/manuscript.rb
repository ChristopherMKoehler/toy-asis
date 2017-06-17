class Manuscript
  include Mongoid::Document

  embeds_many :authors

  field :code, type: String
  field :title, type: String
  field :status, type: String
  field :status_date, type: Date

  def self.find_manuscript(code, last_name)
    found_author = false
    last_name = last_name.strip.downcase

    if last_name.length > 1
      Mongoid.raise_not_found_error = false
      manuscript = Manuscript.find_by(code: code)

      if manuscript
        authors = manuscript.authors[0...3].map{ |auth| auth.last_name.downcase }
        #Are there any author names with the following two traits
        #1. if the last_name's length is greater than two, does it appear at the beginning of the author's last name?
        #2. if the last_name is exactly equal to the last name of the author
        found_author = authors.any?{ |auth| (auth === last_name) || (auth.index(last_name) === 0 && last_name.length > 2) }
      end
    end
    found_author ? manuscript : nil
  end
end
