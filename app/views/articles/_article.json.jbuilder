json.extract! article, :id, :aid, :title, :body, :lcode, :scode, :author, :created_at, :updated_at
json.url article_url(article, format: :json)