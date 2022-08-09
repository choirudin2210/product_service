class ProductMailer < ApplicationMailer
  default from: "product@service.com"

  def is_active_watch_email()
    @product = params[:product]
    mail(to: "test@gmail.com", subject: 'Product Activate')
  end
end
