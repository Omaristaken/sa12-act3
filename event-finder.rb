require 'httparty'
require 'json'

def fetch_events(api_key, city, state)
  url = "https://www.eventbriteapi.com/v3/events/search/?token=#{api_key}&location.address=#{city},#{state}"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def display_events(events)
  if events['events'].nil? || events['events'].empty?
    puts "No upcoming events found."
  else
    events['events'].each do |event|
      name = event['name']['text']
      venue = event['venue']['name']
      start_time = event['start']['local']
      end_time = event['end']['local']

      puts "Name: #{name}"
      puts "Venue: #{venue}"
      puts "Start Time: #{start_time}"
      puts "End Time: #{end_time}"
    end
  end
end


api_key = 'TXXEVM6HG6MIY73LBIWV'
city = 'Memphis'
state = 'TN'


events = fetch_events(api_key, city, state)
display_events(events)
