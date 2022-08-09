require "rails_helper"

RSpec.describe ProductMailer, :type => :mailer do
  describe "notify" do
    let(:product){ create(:product) }
    let(:mail) { ProductMailer.with(product: product ).is_active_watch_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Product Activate")
      expect(mail.to).to eq(["test@gmail.com"])
      expect(mail.from).to eq(["product@service.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match "#{product.name}"
    end
  end
end