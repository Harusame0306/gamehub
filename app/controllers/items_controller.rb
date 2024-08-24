class ItemsController < ApplicationController

  require 'rakuten_web_service'

  def search
    if params[:keyword]
        @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
      end
  end

end
