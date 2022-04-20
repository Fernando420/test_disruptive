module HomeHelper

  def application(app)
    case app
    when 0
      "Binance"
    when 1
      "Coinmarketcap"
    when 2
      "Messari"
    end
  end
end
