class HomeController < ApplicationController
	require 'find'
  def index
  end

  def documents
  	@documents = Document.all
  end
end
