require 'spec_helper'

describe ManuscriptController do
  describe "GET index" do
    it "renders the index template" do
      Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
        m.authors << Author.new(publish_name: 'Smith,Joe')
        m.authors << Author.new(publish_name: 'Li,Wen')
        m.authors << Author.new(publish_name: 'Jones,Ben')
      end

      get :index, {code: "AA1001", last_name: "jon"}
      expect(response).to render_template("show")
    end

    it "redirects back to inquiry if no manuscript is found" do
      Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
        m.authors << Author.new(publish_name: 'Smith,Joe')
        m.authors << Author.new(publish_name: 'Li,Wen')
        m.authors << Author.new(publish_name: 'Jones,Ben')
      end

      get :index, {code: "AA1001", last_name: "pol"}
      expect(response).to redirect_to("http://test.host/inquiry?code=AA1001&errors=Manuscript+not+found.&lname=pol")

    end
  end
end
