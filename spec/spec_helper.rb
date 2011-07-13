$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'rmeetup'

TEST_ROOT = File.dirname(__FILE__) unless defined? TEST_ROOT

# Override the get_response portion of fetchers
# so that we don't have to go out and hit the internets
module RMeetup::FakeResponse
  module Error
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'error.json'))
      end
  end
  
  module Cities
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'cities.json'))
      end
  end
  
  module Comments
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'comments.json'))
      end
  end
  
  module Events
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'events.json'))
      end
  end
  
  module Groups
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'groups.json'))
      end
  end
  
  module Members
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'members.json'))
      end
  end
  
  module Photos
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'photos.json'))
      end
  end
  
  module Rsvps
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'rsvps.json'))
      end
  end
  
  module Topics
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'topics.json'))
      end
  end
end