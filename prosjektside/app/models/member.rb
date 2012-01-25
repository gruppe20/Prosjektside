class Member < ActiveRecord::Base
    #Lagrer bilder i /public/uploads/<dagensdato yyyy-mm-dd>
    PHOTO_STORE = File.join Rails.root, 'public','uploads' #, Date.today.to_s
    
    after_save :save_photo
    
    validates :name, :presence => true
    validates :age, :presence => true
    validates_presence_of :pic
    
    def load_photo_file=(data)
        #ext er extension for filen, feks ".jpg"
        @ext = File.extname(data.original_filename)
        #self.pic = "#{Date.today.to_s}/#{data.original_filename}"
        self.pic = "files.rixim.no/hovedprosjekt/#{Date.today.to_s}/#{data.original_filename}"
        @photo_data = data
        
    end
  
    def save_photo
        
        #Er det riktig filtype?
        if @photo_data && [".jpg", ".jpeg", ".gif", ".png"].include?(@ext) #@ext =~ /\A(?:.jpg|.jpeg|.gif|.png)\z/ #ext != [".jpg", ".jpeg", ".png", ".gif"]
            ftp = Net::FTP.new('files.rixim.no', 'hovedprosjekt@rixim.no', '1337pr0')
            ftp.passive = true
            # name er full path til bildet
            #name = File.join PHOTO_STORE, self.pic

            #Hvis mappen ikke finnes, opprett den
            #if !File.exists?(File.dirname(name))
            #    Dir.mkdir(File.dirname(name))
            #end
            if !ftp.nlst().include?("#{Date.today.to_s}")
                ftp.mkdir "#{Date.today.to_s}"
            end
            #Skriv data til fil
            #File.open(name, 'wb') do |f|
            #    f.write(@photo_data.read)
            #end
            ftp.storbinary("STOR " + "#{Date.today.to_s}/#{@photo_data.original_filename}", StringIO.new(@photo_data.read), Net::FTP::DEFAULT_BLOCKSIZE)

            @photo_data = nil
            ftp.quit()
         end
         
    end
    
end
