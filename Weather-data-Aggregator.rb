require 'httparty'
require 'json'


city = 'Memphis'
time = Date.new(2024, 4, 4)
api_key = 'a4ac010fbc064753b5d193002241404'

response = HTTParty.get("http://api.weatherapi.com/v1/history.json?key=#{api_key}&q=#{city}&dt=#{time}")

if response.code == 200
  hour_data = response['forecast']['forecastday'][0]['hour']
  hour_temps = hour_data.map { |x| x['temp_f'] }
  average_temperature = hour_temps.sum(0.0) / hour_temps.size
  puts "Average temperature in #{city} on #{time}: #{average_temperature.round(2)}°F"
else
  puts "Error: #{response['error']['message']}"
end
