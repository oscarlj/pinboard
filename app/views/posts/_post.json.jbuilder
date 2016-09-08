json.extract! post, :id, :title, :content, :date, :category_id, :board_id, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)