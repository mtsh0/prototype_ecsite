class OrderNotifier < ApplicationMailer
  default from: 'from@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: "#{order.user.email}", subject: 'うえのとしひろのショッピングサイト 注文内容の確認'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.manager_received.subject
  #
  def manager_received(order)
    @order = order
    mail to: "aaa@example.org", subject: '注文が入りました'
  end
end
