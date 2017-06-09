class Author
  include Mongoid::Document

  embedded_in :manuscript

  field :publish_name, type: String

  def last_name
    publish_name.split(',').first.strip
  end
end
