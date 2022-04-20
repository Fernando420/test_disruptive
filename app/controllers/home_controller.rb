class HomeController < ApplicationController

  before_action :set_price, except: [:add_proyection]

  def index
    @title = t('home.title')
    set_application
  end

  def create

  end

  def add_proyection
    if params[:amount].to_f > 0
      # Generate proyection 12 months
      response = Proyection.generate(params)
    else
      response = {success: false, message: "The amount must be greater than 0"}
    end
    @response = response
  end

  private

    def set_price
      # Get Price BTC and ETH in Binance, Messari and Cryptomarketcap
      response = GetPriceCurrency.set_price
      @currencies_price = response[:data]
    end

    def set_application
      @set_application ||= [['Binance', 0],['Coinmarketcap', 1],['Messari', 2]]
    end
end
