require 'spec_helper'

describe NanoApi::PlacesController do
  describe 'GET index' do
    it 'should forward place json received from api call' do
      NanoApi::Client.should_receive(:auto_complete_places).with('temp').and_return('[place1, place2]')

      get :index, use_route: :nano_api, temp: 'temp'

      response.content_type.should == Mime::JSON
      response.body.should == '[place1, place2]'
    end

    it 'should handle api errors' do
      NanoApi::Client.should_receive(:auto_complete_places)

      get :index, use_route: :nano_api, temp: ''
      
      response.body.should be_blank
    end
  end
end