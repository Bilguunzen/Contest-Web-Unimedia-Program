json.extract! contest, :id, :title, :detail, :deadline, :prize, :sponsor, :splogo, :created_at, :updated_at
json.url contest_url(contest, format: :json)
