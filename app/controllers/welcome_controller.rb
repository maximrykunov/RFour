class WelcomeController < ApplicationController

  before_filter :init_client

  def index
    if params[:search]
      @venues = @client.search_venues(near: 'Moscow, Russia', query: params[:search])
    end
  end

  def venue_details
    if params[:id]
      @venue = @client.venue(params[:id])
    end
  end

  private

  def init_client
    @client = Foursquare2::Client.new(client_id: '1VQL0053LZY42EWKV31SWGSDGO3IVUNJ1DDD4KNGI1I34CZS',
                                      client_secret: 'WELWJHGMJT5LNK13DG200P10YU0ZYC5KCWRL54HR2OH51FN0',
                                      api_version: '20120505')
  end
end
