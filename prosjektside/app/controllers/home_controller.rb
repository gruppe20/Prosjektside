class HomeController < ApplicationController
	require 'find'
	require 'net/ftp'
  def index
  end

  def documents
  	@documents = Document.all
  end
end
