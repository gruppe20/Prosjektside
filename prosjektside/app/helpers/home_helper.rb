module HomeHelper
	def doc_path(file)
		File.join('/uploads', file).to_s
	end
	def uploads_path(file)
		File.join('/uploads', file).to_s
	end
end
