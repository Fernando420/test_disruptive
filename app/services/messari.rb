class Messari

  include HTTParty
  debug_output $stdout

  def self.base_url
    "#{ENV['MESSARI_DOMAIN']}"
  end
    
  def self.headers
    {
      'x-messari-api-key' => ENV['MESSARI_KEY'],
      'cache-control' => 'no-cache',
      'Content-Type'  => "application/json"
    }
  end

  def self.set_price(args)
    response = HTTParty.get("#{base_url}/api/v1/assets/#{args[:currency]}/metrics", :headers => headers, :debug_output => $stdout)
    JSON.parse(response.body)
  end


end