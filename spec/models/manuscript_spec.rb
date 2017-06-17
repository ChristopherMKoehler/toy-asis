require 'spec_helper'

describe Manuscript do
  describe 'persistence' do
    let(:valid_attributes) do
      Hash[code: 'AA1001', title: 'some title', status: 'NEW', :status_date => Date.today]
    end

    it 'creates with valid attributes' do
      Manuscript.create!(valid_attributes)
    end
  end

  describe 'Manuscript.find_by' do
    before(:each) do
      Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
        m.authors << Author.new(publish_name: 'Smith,Joe')
        m.authors << Author.new(publish_name: 'Li,Wen')
        m.authors << Author.new(publish_name: 'Jones,Ben')
      end
    end

    it 'ignores surrounding whitespace and case' do
      manuscript = Manuscript.find_manuscript("AA1001", " smIth")
      expect(manuscript).to be_truthy
    end

    it "accepts a match on first 3 characters" do
      manuscript = Manuscript.find_manuscript("AA1001", "jon")
      expect(manuscript).to be_truthy
    end

    it "rejects a match on less than 3 characters" do
      manuscript = Manuscript.find_manuscript("AA1001", "jo")
      expect(manuscript).to be_falsey
    end

    it "accepts an exact match for a 2 character author name" do
      manuscript = Manuscript.find_manuscript("AA1001", "li")
      expect(manuscript).to be_truthy
    end

    it "rejects an exact match on 1 character author name" do
      Manuscript.create(code: 'BB1001', title: 'My awesome paper again', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
        m.authors << Author.new(publish_name: 'P,Mary')
      end

      manuscript = Manuscript.find_manuscript("BB1001", "p")
      expect(manuscript).to be_falsey
    end

    it "rejects a mismatch on characters beyond 3" do
      manuscript = Manuscript.find_manuscript("AA1001", "jonis")
      expect(manuscript).to be_falsey
    end
  end
end
