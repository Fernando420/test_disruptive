class Proyection

  attr_accessor :data, :proyection
  
  def self.generate(data)
    g = self.new
    g.data = data
    g.proyection = []
    g.extract
  end
  
  def extract
    currencies.each do |currency|
      amount = self.data[:amount].to_f
      price = price(currency.short_name)
      arr = []
      (1..12).each do |i|
        interest = amount*(currency.monthly_interest/100)
        amount+=interest
        amount_crypto = convert(amount,currency.short_name)
        arr << {month: i, amount_usd: amount.to_f, amount_crypto: amount_crypto}
      end
      self.proyection << {interest: currency.monthly_interest, currency: currency.short_name,amount: self.data[:amount].to_f, data: arr, application: self.data[:application]}
    end
    return {success: true, proyections: self.proyection, amount: self.data[:amount] }
  end

  def convert(amount,currency)
    case self.data[:application].to_i
    when 0
      ConvertAmountUsd.binance(amount,currency)
    when 1
      ConvertAmountUsd.coinmarketcap(amount,currency)
    when 2
      ConvertAmountUsd.messari(amount,currency)
    end
  end

  def price(currency)
    case self.data[:application].to_i
    when 0
      set_price[:data].map {|c| c[:application] == "Binance" && c[:name] == currency}
    when 1
      set_price[:data].map {|c| c[:application] == "Coinmarketcap" && c[:name] == currency}
    when 2
      set_price[:data].map {|c| c[:application] == "Messari" && c[:name] == currency}
    end
  end

  def set_price
    @set_price ||= GetPriceCurrency.set_price
  end

  def currencies
    @currencies ||= Currency.where.not(short_name: "ALL")
  end

end
  