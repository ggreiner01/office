json.extract! supplier, :id, :supplierid, :name, :address, :phonenum, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
