class Coinmarketcap

  include HTTParty
  debug_output $stdout

  def self.base_url
    "#{ENV['COINMARKETCAP_DOMAIN']}"
  end
    
  def self.headers
    {
      'X-CMC_PRO_API_KEY' => ENV["COINMARKETCAP_KEY"],
      'cache-control' => 'no-cache',
      'Content-Type'  => "application/json"
    }
  end

  def self.set_price(args)
    response = HTTParty.get("#{base_url}/v1/cryptocurrency/trending/latest",query: args, :headers => headers, :debug_output => $stdout)
    JSON.parse(response.body)
  end

  def self.convert_amount(args)
    response = HTTParty.get("#{base_url}/v2/tools/price-conversion", query: args ,:headers => headers, :debug_output => $stdout)
    JSON.parse(response.body)
  end
  
end