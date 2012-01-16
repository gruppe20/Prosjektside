class UploadFile < ActiveRecord::Base
	#Lagrer filer i /public/uploads/<dagensdato yyyy-mm-dd>	
	
	
	DOKU_STORE = File.join Rails.root, 'public','uploads' #, Date.today.to_s
	
	def upload_file_file=(data)
       self.file = "#{Date.today.to_s}/#{data.original_filename}"       
       @file_data = data    
    end
	
    def save_file
    #self.save(upload_file)
    name1 = "#{Date.today.to_s}/#{upload_file['datafile'].original_filename}"
    name = File.join DOKU_STORE, name1
	
	##Oppretter mappen om den ikke finnes.
	if !File.exists?(File.dirname(name))
        Dir.mkdir(File.dirname(name))
    end
    
    #Skriver data til fil
    File.open(name, 'f') do |f|
                f.write(file_data.read)
    end
    @file_data = nil    
         
end
