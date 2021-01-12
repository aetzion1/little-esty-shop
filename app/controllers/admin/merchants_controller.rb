class Admin::MerchantsController < ApplicationController
    layout 'admin'

    def index
        @merchants = Merchant.all
    end

    def show
        @merchant = Merchant.find(params[:id])
    end

    def edit
        @merchant = Merchant.find(params[:id])
    end
    
end