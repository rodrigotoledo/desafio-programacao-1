App.import_purchase_lines = App.cable.subscriptions.create 'ImportPurchaseLinesChannel',
  # Called when the subscription is ready for use on the server
  connected: ->

  # Called when the subscription has been terminated by the server
  disconnected: ->

  received: (data) ->
    if data['import_purchases'].length
      i = 0
      while i < data['import_purchases'].length
        id = data['import_purchases'][i].id
        $('#import_purchase_lines_importeds_'+id).html data['import_purchases'][i].lines_importeds
        $('#import_purchase_lines_with_success_'+id).html data['import_purchases'][i].lines_with_success
        $('#import_purchase_lines_with_errors_'+id).html data['import_purchases'][i].lines_with_errors
        $('#import_purchase_lines_status_'+id).html data['import_purchases'][i].status
        $('#import_purchase_lines_updated_at_'+id).html data['import_purchases'][i].updated_at
        i++
    return
