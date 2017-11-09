require 'sinatra'
require 'httparty'
require 'nokogiri'

get '/' do

	url = "https://miami.craigslist.org/search/sof"
	response = HTTParty.get url

	html = response.body
	dom = Nokogiri::HTML(html)
	links = dom.css("a.hdrlnk")

	links.map do |link|
		'<h7>' + link.to_str + '<br>' + link['href'] + '</h7>' '<br><br>'
	end 
end