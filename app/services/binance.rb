class Binance

  def self.base_url
    "#{ENV['BINANCE_DOMAIN']}"
  end
    
  def self.headers
    {
      'x-binance-api-key' => ENV['BINANCE_KEY'],
      'x-binance-secret-key' => ENV['BINANCE_SECRET_KEY'],
      'cache-control' => 'no-cache',
      'Content-Type'  => "application/json"
    }
  end

  def self.set_price(args)
    response = HTTParty.get("#{base_url}/api/v1/ticker/price", query: args, :headers => headers, :debug_output => $stdout)
    JSON.parse(response.body)
  end

end