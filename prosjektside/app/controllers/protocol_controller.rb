require 'nokogiri'
require 'open-uri'

class ProtocolController < ApplicationController
  def index
    baseUrl = "http://host175.hostmonster.com/pipermail/hovedprosjekt_lists.rixim.no/"
    url = (params[:url] != nil) ? baseUrl + params[:url] : baseUrl
    doc = Nokogiri::HTML(open(url))

    doc.xpath('//a').each do |link|
      path = link['href']
      basePath = (/^.+\//.match(params[:url]) == nil) ? nil : /^.+\//.match(params[:url])[0]
      if /http/.match(path)
      else
        link['href'] = "/protocol/"+ "#{basePath or ''}" + "#{path or ''}"
      end
    end

    @body = doc.at_xpath("//body").to_html
  end # index
end # class