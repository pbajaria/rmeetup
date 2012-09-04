module RMeetup
  module Fetcher
    class Profiles < Base
      def initialize
        @type = :members
      end
      
      # Turn the result hash into a Member Class
      def format_result(result)
        RMeetup::Type::Profile.new(result)
      end
    end
  end
end