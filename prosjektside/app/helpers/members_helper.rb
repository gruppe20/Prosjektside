module MembersHelper
    def uploads_path(file)
        File.join('/uploads', file).to_s
    end
end
