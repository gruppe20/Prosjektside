module HomeHelper
	def doc_path(file)
		File.join('/dokumenter', file).to_s
	end
end
