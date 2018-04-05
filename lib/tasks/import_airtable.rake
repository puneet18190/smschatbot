require 'airtable'
task import_airtable: :environment do
	@client = Airtable::Client.new('keymrHXseo9QzWnF4')
	@table = @client.table('appfHaDk94Fr93kEv', "Clients")
	@results = @client.table('appfHaDk94Fr93kEv', "Results")	
	@records = @table.records
	@records.each do |c|
		check_client = Client.where(clientid: c.id)
		if check_client.blank?
			client = Client.new(clientid: c.id,mobile: c.mobile,first_name: c.first_name,last_name: c.last_name,email: c.email,avg_revenue: c.all_time_average_revenue)
			client.save
		else
			client = check_client.first
		end

		c.results.each do |c_r|
			check_result = Result.where(resultid: c_r)
			if check_result.blank?
				r = @results.find(c_r)
				result = client.results.new(resultid: r.id, help: r.help, revenue_last_month: r.revenue_last_month, mobile_number: r.mobile_number,income_goal: r.income_goal_this_month, date: r.date)
				result.save
			end
		end
	end
end