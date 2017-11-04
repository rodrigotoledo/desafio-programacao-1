App.import_purchase_lines = App.cable.subscriptions.create 'ImportPurchaseLinesChannel',
  received: (data) ->
    console.log(data)
    if $('#import_purschase_' + data['import_purchase_id']).length
      $('#import_purchase_lines_importeds_' + data['import_purchase_id']).html data['import_purchase_lines_importeds']
      $('#import_purchase_lines_with_success_' + data['import_purchase_id']).html data['import_purchase_lines_with_success']
      $('#import_purchase_lines_with_errors_' + data['import_purchase_id']).html data['import_purchase_lines_with_errors']
    return