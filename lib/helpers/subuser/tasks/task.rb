module SendGrid
  class Task
    attr_reader :name, :subuser, :sendgrid_client

     def initialize(name, subuser, sendgrid_client)
       @name = name
       @subuser = subuser
       @sendgrid_client = sendgrid_client
     end

     def make_request
     end
  end
end