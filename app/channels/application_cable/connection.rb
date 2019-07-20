module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper

    identified_by :message_user

    # connect method gets called when the connection is made
    def connect
      self.message_user = find_verified_user
    end

    private
      def find_verified_user
        if logged_in?
          current_user
        else 
          reject_unauthorized_connection
        end
      end
  end
end
