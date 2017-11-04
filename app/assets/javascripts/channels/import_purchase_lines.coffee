App.import_purchase_lines = App.cable.subscriptions.create 'ImportPurchaseLinesChannel',
  received: (data) ->
    console.log(data)
    return
