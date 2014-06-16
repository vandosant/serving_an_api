require 'rails_helper'

describe 'Cars API' do

  describe 'GET /cars' do
    it 'returns a list of cars' do
      buick = create_make(name: "Buick")
      chevy = create_make(name: "Chevy")
      grand_national = create_car(color: "Black", doors: 2, purchased_on: "1987-10-04", make_id: buick.id)
      el_camino = create_car(color: "Blue", doors: 2, purchased_on: "1992-01-24", make_id: chevy.id)

      get '/cars', {}, {'Accept' => 'application/json'}

      expected = {
        "_links" => {"self" => {"href" => "/cars"}},
        "_embedded" => {
          "cars" => [
            {
              "_links" => {
                "self" => {"href" => "/cars/#{grand_national.id}"},
                "make" => {"href" => "/makes/#{buick.id}"}
              },
              "id" => grand_national.id, "color" => grand_national.color, "doors" => grand_national.doors, "purchased_on" => "1987-10-04"},
            {
              "_links" => {
                "self" => {"href" => "/cars/#{el_camino.id}"},
                "make" => {"href" => "/makes/#{chevy.id}"}
              },
              "id" => el_camino.id, "color" => el_camino.color, "doors" => el_camino.doors, "purchased_on" => "1992-01-24"}
          ]
        }}
      
      expect(response.code.to_i).to eq 200
      expect(JSON.parse(response.body)).to eq expected
    end
  end

end
