class HomeController < ApplicationController
	before_action :set_import_purchase, only: :index
	before_action :set_import_purchase_with_params, only: :import
	before_action :set_import_purchases

	def index
		scheduler = Rufus::Scheduler.new
		scheduler.every '5s' do
			import_purchases = []
			if @import_purchases.where("status != ?",:finished).count > 0
				@import_purchases.where("status != ?",:finished).each do |import_purchase|
					import_purchases << {
						id: import_purchase.id,
						lines_with_success: import_purchase.lines_with_success,
						lines_with_errors: import_purchase.lines_with_errors,
						lines_importeds: import_purchase.lines_importeds,
						status: t("import_status.#{import_purchase.status.to_s}"),
					}
				end
				ActionCable.server.broadcast("import_purchase_lines_channel",
					import_purchases: import_purchases
				)
			else
				scheduler.stop
			end
		end
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
			@import_purchases = ImportPurchase.order("id DESC").page(params[:page])
		end

		def set_import_purchase_with_params
			@import_purchase = ImportPurchase.new(import_purchase_params)
		end
end
