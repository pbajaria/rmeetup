module RMeetup
  module Type
    
    # == RMeetup::Type::Member
    #
    # Data wraper for a Member fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this member.
    
    # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
    # See http://www.meetup.com/meetup_api/docs/members/ for available fields
    
    class Profile
      attr_accessor :profile
      
      def initialize(profile = {})
        self.profile = profile
      end
      
      def method_missing(id, *args)
        return self.profile[id.id2name]
      end
      
      # Special accessors that need typecasting or other parsing
      
      def member_id
        return self.profile['id'].to_i
      end
    end
  end
end