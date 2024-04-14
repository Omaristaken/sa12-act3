require 'httparty'
require 'json'

def currency_conversion(amt: 100, from: 'USD', to: 'EUR')
  currency = from
  api_key = 'a889160b22a021230c982c70'

  response = HTTParty.get("https://v6.exchangerate-api.com/v6/#{api_key}/latest/#{currency}")
  data = JSON.parse(response.body)

  conversion_rate = data['conversion_rates'][to]
  converted_amount = conversion_rate * amt

  "#{amt} #{from} is equal to #{converted_amount.round(2)} #{to}"
end

puts currency_conversion()
