module RMeetup
  module Fetcher
    class Rsvps < Base
      def initialize
        @type = :rsvps
      end

      # Turn the result hash into a Rsvp Class
      def format_result(result)
        RMeetup::Type::Rsvp.new(result)
      end

      def base_url
        "http://api.meetup.com/2/#{@type}.json/"
      end
    end
  end
end