class AdminController < ApplicationController
    #http_basic_authenticate_with :name => "gruppe20", :password => "test", :except => :index
    #before_filter :basic_http_authentication
  def index
        
  end
    
  def about
    @members = Member.all
  end
    
  def documents
    @documents = Document.all
		@uploads = Dir.glob("public/uploads/*")
		for file in @uploads
			puts file
    end
	end
	
	def destroy
    #@member = Member.find(params[:id])
   # @uploads.destroy

    #respond_to do |format|
     # format.html { redirect_to admin_url }
      #format.json { head :ok }
    #end
  end
	
	
end
