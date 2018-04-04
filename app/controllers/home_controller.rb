class HomeController < ApplicationController
  def index
  	@client = Airtable::Client.new("keymrHXseo9QzWnF4")
  	@table = @client.table("appfHaDk94Fr93kEv", "Clients")
  	@records = @table.records
  end

  def results
  	@client = Airtable::Client.new("keymrHXseo9QzWnF4")
  	@table = @client.table("appfHaDk94Fr93kEv", "Clients")
  	client = @table.find(params[:client])
  	results = client.results
  	@data = []
  	@results = @client.table("appfHaDk94Fr93kEv", "Results")	
  	results.each do |r|
  		@data << @results.find(r)
  	end
  end
end
