class Document < ActiveRecord::Base
	#Lagrer filer i /public/uploads/<dagensdato yyyy-mm-dd>	
	
	
	DOKU_STORE = File.join Rails.root, 'public','uploads' #, Date.today.to_s


	after_save :save_doc
    
    validates_presence_of :doc
    
    def load_doc_file=(data)
        #ext er extension for filen, feks ".jpg"
        @ext = File.extname(data.original_filename)
        self.doc = "#{Date.today.to_s}/#{data.original_filename}"
        
        @doku_data = data
        
    end
  
    def save_doc
    	
        # name er full path til bildet
        name = File.join DOKU_STORE, self.doc

        #Hvis mappen ikke finnes, opprett den
        if !File.exists?(File.dirname(name))
            Dir.mkdir(File.dirname(name))
        end
        #Skriv data til fil
        File.open(name, 'wb') do |f|
            f.write(@doku_data.read)
        end
        @doku_data = nil
    end
       
end
