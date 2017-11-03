class ImportPurchaseLinesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "import_purchase_lines_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
