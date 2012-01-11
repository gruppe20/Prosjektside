class AdminController < ApplicationController
    #http_basic_authenticate_with :name => "gruppe20", :password => "test", :except => :index
    #before_filter :basic_http_authentication
    def index
        
    end
    def about
    	@members = Member.all
    end
end
