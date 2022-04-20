class GetPriceCurrency

  attr_accessor :data
  
  def self.set_price
    g = self.new
    g.data = []
    g.extract
  end

  def extract
    set_binance
    set_messari
    set_coinmarketcap
    return {data: self.data}
  end

  def set_binance
    currencies.each do |currency|
      response = currencies_binance({symbol: "#{currency.short_name}USDT"})
      self.data << {
        application: "Binance",
        name: currency.short_name,
        price: response['price']
      }
    end
  end

  def set_messari
    currencies.each do |currency|
      response = currencies_messari({currency: "#{currency.short_name}"})
      if response['data'].present?
        response = response['data']
        p response
        self.data << {
          application: "Messari",
          name: currency.short_name,
          price: response["market_data"]["price_usd"]
        }
      end
    end
  end

  def set_coinmarketcap
    currencies.each do |currency|
      response = currencies_coinmarketcap({symbol: currency.short_name, amount: 1, convert: "USD"})
      p response
      if response['data'].present? 
        response = response['data'].first
        self.data << {
          application: "Coinmarketcap",
          name: currency.short_name,
          price: response["quote"]["USD"]['price']
        }
      end
    end
  end

  def currencies
    @currencies ||= Currency.where.not(short_name: "ALL")
  end

  def currencies_messari(args)
    Messari.set_price(args)
  end

  def currencies_binance(args)
    Binance.set_price(args)
  end

  def currencies_coinmarketcap(args)
    Coinmarketcap.convert_amount(args)
  end

end