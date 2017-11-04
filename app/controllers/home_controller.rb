class HomeController < ApplicationController
  before_action :set_import_purchase, only: :index
  before_action :set_import_purchase_with_params, only: :import
  before_action :set_import_purchases

  def index
  end

  def import
    if @import_purchase.save
      redirect_to root_path, notice: t('forms.messages.operation_with_success')
    else
      flash[:error] = t('forms.messages.operation_with_error')
      render :index
    end
  end

  private
    def import_purchase_params
      params.require(:import_purchase).permit(:import_file, :user_id)
    end

    def set_import_purchase
      @import_purchase = ImportPurchase.new
    end

    def set_import_purchases
      @import_purchases = ImportPurchase.order("id DESC")
    end

    def set_import_purchase_with_params
      @import_purchase = ImportPurchase.new(import_purchase_params)
    end
end
