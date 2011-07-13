module RMeetup
  module Fetcher
    class OpenEvents < Base
      def initialize
        @type = :open_events
      end
      
      # Turn the result hash into a Event Class
      def format_result(result)
        RMeetup::Type::OpenEvent.new(result)
      end

      def base_url
        "http://api.meetup.com/2/#{@type}.json/"
      end

    end
  end
end