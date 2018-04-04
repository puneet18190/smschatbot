class HomeController < ApplicationController
  def index
  	@client = Airtable::Client.new(ENV['AIRTABLE_API_KEY'])
  	@table = @client.table(ENV['AIRTABLE_APP_KEY'], "Clients")
  	@records = @table.records
  end

  def results
  	@client = Airtable::Client.new(ENV['AIRTABLE_API_KEY'])
  	@table = @client.table(ENV['AIRTABLE_APP_KEY'], "Clients")
  	client = @table.find(params[:client])
  	results = client.results
  	@data = []
  	@results = @client.table(ENV['AIRTABLE_APP_KEY'], "Results")	
  	results.each do |r|
  		@data << @results.find(r)
  	end
  end

  def send_sms
  	begin
	  	@client = Airtable::Client.new(ENV['AIRTABLE_API_KEY'])
	  	@table = @client.table(ENV['AIRTABLE_APP_KEY'], "Clients")
	  	@records = @table.records
	  	@data = []
	  	@client = Twilio::REST::Client.new ENV['TWILIO_SECRET'], ENV['TWILIO_TOKEN']
	  	@res = []
	  	@records.each do |c|
		  	@res << c.messages.create({
			    from: ENV['TWILIO_NUMBER'],
			    to: c.mobile,
			    body: 'What was your revenue last month?'
			  })
			end
			render json: {status: true, data: @res}
		rescue Exception => e
			render json: {status: false, data: e.message}
		end
  end
end
