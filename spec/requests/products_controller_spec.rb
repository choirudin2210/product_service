require 'rails_helper'

RSpec.describe "ProductsControllers", type: :request do

  let!(:product)    {create(:product, name: "laptop", category: 'electronic', price: 5000000)}

  describe "GET /index" do
    before { get "/products.json" } 

    it "return status code 200" do
        expect(response).to have_http_status(200)
    end
  end

  describe "GET single /products" do

    before { get "/products/#{product.id}.json" } 

    it "return status code 200" do
        expect(response).to have_http_status(200)
    end
  end

  describe "POST create /products" do

    let(:valid_attributes) { 
            { product: {  
                name: "nama",
                price: 10000,
                category: 'category',
                image: fixture_file_upload('files/spongebob.png', 'image/png'),
            }}
        }

    before { post "/products", params: valid_attributes } 

    it "return status code 201" do
        expect(response).to have_http_status(201)
    end
  end

  describe "POST edit /products" do

    let(:valid_attributes) { 
            { product: {  
                name: "nama",
                price: 10000,
                category: 'category',
                image: fixture_file_upload('files/spongebob.png', 'image/png'),
            }}
        }

    before { patch "/products/#{product.id}.json", params: valid_attributes } 

    it "return status code 200" do
        expect(response).to have_http_status(200)
    end
  end

  describe "DELETE delete /products" do

    before { delete "/products/#{product.id}.json" } 

    it "return status code 204" do
        puts response.body
        expect(response).to have_http_status(204)
    end
  end

end
