class Document < ActiveRecord::Base
	#Lagrer filer i /public/uploads/<dagensdato yyyy-mm-dd>	
	
	#DOKU_STORE = File.join 'files.rixim.no/hovedprosjekt' #, Date.today.to_s
	#DOKU_STORE = File.join Rails.root, 'public','uploads' #, Date.today.to_s
    
#files.rixim.no/hovedprosjekt
	after_save :save_doc
    
    validates_presence_of :doc
    
    def load_doc_file=(data)
        #ext er extension for filen, feks ".jpg"
        @ext = File.extname(data.original_filename)
        self.doc = "files.rixim.no/hovedprosjekt/#{Date.today.to_s}/#{data.original_filename}"
        
        @doku_data = data
        
    end
  
    def save_doc
    	ftp = Net::FTP.new('files.rixim.no', 'hovedprosjekt@rixim.no', '1337pr0')
        ftp.passive = true
        # name er full path til bildet
        #name = File.join DOKU_STORE, self.doc

        #Hvis mappen ikke finnes, opprett den
        #if !File.exists?(File.dirname(name))
        #    Dir.mkdir(File.dirname(name))
        #end
        #ftp.chdir "hovedprosjekt"
        #begin 
        #    ftp.mkdir "#{Date.today.to_s}"
        #rescue

        #ensure
        #    ftp.storbinary("STOR " + "#{Date.today.to_s}/#{doku_data.original_filename}", StringIO.new(doku_data.read), Net::FTP::DEFAULT_BLOCKSIZE)
        #end
        if !ftp.nlst().include?("#{Date.today.to_s}")
            ftp.mkdir "#{Date.today.to_s}"
        end
        #Skriv data til fil
        ftp.storbinary("STOR " + "#{Date.today.to_s}/#{@doku_data.original_filename}", StringIO.new(@doku_data.read), Net::FTP::DEFAULT_BLOCKSIZE)
        #File.open(name, 'wb') do |f|
        #    f.write(@doku_data.read)
        #end
        @doku_data = nil
        ftp.quit()
    end
       
end
