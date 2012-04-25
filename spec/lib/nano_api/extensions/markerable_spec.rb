require 'spec_helper'

describe NanoApi::Extensions::Markerable do
  context do
    include RSpec::Rails::ControllerExampleGroup

    controller do
      include NanoApi::Extensions::Markerable

      before_filter :handle_marker

      def new
        render :nothing => true
      end
    end

    it 'should save marker in search_params' do
      get :new, :marker => 'referrer'

      controller.send(:marker).should == 'referrer'
    end

    it 'should handle ref parameter as marker too' do
      get :new, :ref => 'referrer'

      controller.send(:marker).should == 'referrer'
    end

    it 'should save new marker in cookies' do
      get :new, :marker => 'referrer'

      controller.send(:cookies)[:marker].should == 'referrer'
    end

    it 'should update cookies if new marker is affiliate marker' do
      get :new, :marker => 'test'
      get :new, :marker => '12345'

      controller.send(:cookies)[:marker].should == '12345'
    end

    it 'should update affiliate cookies if new marker is affiliate marker' do
      get :new, :marker => '12346'
      get :new, :marker => '12345'

      controller.send(:cookies)[:marker].should == '12345'
    end

    it 'should update cookies if new marker is not affiliate marker' do
      get :new, :marker => 'test'
      get :new, :marker => 'test1'

      controller.send(:cookies)[:marker].should == 'test1'
    end

    it 'should not update affiliate cookies if new marker is not affiliate marker' do
      get :new, :marker => '12345'
      get :new, :marker => 'test1'

      controller.send(:cookies)[:marker].should == '12345'
    end

    it 'should not update cookie expired time for same affiliate requests' do
      get :new, :marker => '12345'

      controller.send(:cookies).should_not_receive(:[]=).with(:marker, an_instance_of(Hash))
      get :new, :marker => '12345'
    end
  end
end