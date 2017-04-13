require 'spec_helper'

describe Author do
  describe '#last_name is derived from first component of comma separated :publish_name' do
    subject(:author) { Author.new }

    example 'Smith from Smith,Joe' do
      author.publish_name = 'Smith,Joe'
      expect(author.last_name).to eql('Smith')
    end

    example 'Smith from Smith,Joe,M' do
      author.publish_name = 'Smith,Joe,M'
      expect(author.last_name).to eql('Smith')
    end

    it 'strips leading/trailing white-space' do
      author.publish_name = " \t\nSmith , Joe"
      expect(author.last_name).to eq('Smith')
    end

    it 'keeps embedded white-space' do
      author.publish_name = 'Smith Jr.,Joe'
      expect(author.last_name).to eq('Smith Jr.')
    end
  end
end
