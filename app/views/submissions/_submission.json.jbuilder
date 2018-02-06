json.extract! submission, :id, :code, :language, :point, :cui_id, :created_at, :updated_at
json.url submission_url(submission, format: :json)
