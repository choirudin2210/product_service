json.extract! product, :id, :name, :price, :category, :is_active, :created_at, :updated_at
json.image_url rails_blob_url(product.image) if product.image.attached?