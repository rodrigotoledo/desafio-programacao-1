class ImportPurchasesController < ApplicationController
  before_action :set_import_purchase

  def import_purchase_with_success
    @import_purchase_lines = @import_purchase.import_purchase_lines.with_success.page(params[:page])
    render :import_purchase_with_success
  end

  def import_purchase_with_error
    @import_purchase_lines = @import_purchase.import_purchase_lines.with_errors.page(params[:page])
    render :import_purchase_with_error
  end

  private
    def set_import_purchase
      @import_purchase = ImportPurchase.find(params[:id])
    end
end
