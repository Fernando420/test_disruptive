class ConvertAmountUsd
  def self.binance(amount,currency)
    
  end

  def self.coinmarketcap(amount,currency)
    response = Coinmarketcap.convert_amount({
        amount: amount.to_f,
        convert: currency,
        symbol: "USD"
    })
    p response
    return response["data"].first["quote"]["#{currency}"]['price']
  rescue Exception => error
    p error 
    return 0
  end

  def self.messari(amount,currency)
    
  end
end