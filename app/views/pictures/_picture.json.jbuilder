json.extract! picture, :id, :file_name, :user_id, :created_at, :updated_at
json.url picture_url(picture, format: :json)
