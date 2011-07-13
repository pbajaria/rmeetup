require 'spec_helper'

describe RMeetup::Client do

  it 'should raise an error when accessing the API before being configured' do
    lambda {
      RMeetup::Client.fetch(:topics)
    }.should raise_error(RMeetup::NotConfiguredError)
  end

  describe 'when configured' do

    before do
      RMeetup::Client.api_key = 'hereismyapikey1234567890'
    end
    
    after do
      RMeetup::Client.api_key = nil
    end
  
    it 'should raise an error when trying to fetch an unknown type' do
      lambda {
        RMeetup::Client.fetch(:clowns)
      }.should raise_error(RMeetup::InvalidRequestTypeError)
    end
  
    it 'should try to get a Topic Fetcher' do
      @topics_fetcher = mock(RMeetup::Fetcher::Topics)
      @topics_fetcher.stub!(:fetch).and_return([])
      RMeetup::Fetcher.should_receive(:for).with(:topics).and_return(@topics_fetcher)
      RMeetup::Client.fetch(:topics, {})
    end
    
  end

end