require 'rails_helper'

RSpec.describe 'Generate rfc requests', type: :request do
  describe 'POST /api/v1/generate_rfc' do
    it  'returns success' do
      post('/api/v1/generate_rfc', params:{
          data:{
              name:             "Francisco",
              last_name:        "Torres",
              second_last_name: "Romero",
              birthdate:        "1995-11-07"
          }
      })
      json = JSON.parse(response.body)
      expect(json['status']).to eql(200)
    end
  end

  describe 'POST /api/v1/generate_rfc' do
    it  'returns error with empty params' do
      post('/api/v1/generate_rfc', params:{
          data:{
              name:             "",
              last_name:        "Torres",
              second_last_name: "",
              birthdate:        "1995-11-07"
          }
      })
      json = JSON.parse(response.body)
      expect(json['status']).to eql(400)
    end
  end
end