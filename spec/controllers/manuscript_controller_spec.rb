require 'spec_helper'

describe ManuscriptController do
  describe "GET show" do
    it "renders the show template" do
      Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
        m.authors << Author.new(publish_name: 'Smith,Joe')
        m.authors << Author.new(publish_name: 'Li,Wen')
        m.authors << Author.new(publish_name: 'Jones,Ben')
      end
      id = Manuscript.find_by(code: "AA1001").id
      get :show, {id: id}
      expect(response).to render_template("show")
    end

    it "redirects back to inquiry if no manuscript is found" do
      Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
        m.authors << Author.new(publish_name: 'Smith,Joe')
        m.authors << Author.new(publish_name: 'Li,Wen')
        m.authors << Author.new(publish_name: 'Jones,Ben')
      end


      get :show, {id: 2}
      expect(response).to redirect_to("http://test.host/inquiry/new")

    end
  end
end
