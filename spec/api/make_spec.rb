require 'rails_helper'

describe "Make API" do

  describe 'GET /makes' do
    it 'returns a list of makes as JSON' do
      ford = create_make(name: "Ford")
      chevy = create_make(name: "Chevy")

      get '/makes', {}, {'Accept' => 'application/json'}

      expected_response = {
          "_links" => {
              "self" => {"href" => makes_path},
          },
          "_embedded" => {
              "makes" => [
                  {
                      "_links" => {
                          "self" => {"href" => make_path(ford)},
                      },
                      "id" => ford.id,
                      "name" => "Ford"
                  },
                  {
                      "_links" => {
                          "self" => {"href" => make_path(chevy)},
                      },
                      "id" => chevy.id,
                      "name" => "Chevy"
                  },
              ]
          },
      }

      expect(response.code.to_i).to eq 200
      expect(JSON.parse(response.body)).to eq(expected_response)
    end

    it 'returns a list of makes as XML' do
      ford = create_make(name: "Ford")
      chevy = create_make(name: "Chevy")

      get '/makes', {}, {'Accept' => 'application/xml'}

      expected_xml = <<-XML
<apiResponse>
  <links>
    <self href="#{makes_path}"/>
  </links>
  <makes>
    <make>
      <links>
        <self href="#{makes_path(ford)}"/>
      </links>
      <id>#{ford.id}</id>
      <name>Ford</name>
    </make>
    <make>
      <links>
        <self href="#{makes_path(chevy)}"/>
      </links>
      <id>#{chevy.id}</id>
      <name>Chevy</name>
    </make>
  </makes>
</apiResponse>
      XML

      expect(response.code.to_i).to eq 200
      expect(response.body).to eq(expected_xml)
    end
  end

  describe 'GET /makes/:id' do
    it 'returns one make' do
      ford = create_make(name: "Ford")

      get "/makes/#{ford.id}", {}, {'Accept' => 'application/json'}

      expected_response = {
          "_links" => {
              "self" => {"href" => make_path(ford)},
          },
          "id" => ford.id,
          "name" => "Ford"
      }

      expect(response.code.to_i).to eq 200
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end
end
