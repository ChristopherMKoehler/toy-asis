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
end
