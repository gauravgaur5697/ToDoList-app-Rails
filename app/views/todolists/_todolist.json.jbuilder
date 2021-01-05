json.extract! todolist, :id, :Todo, :Time, :Date, :status, :important, :created_at, :updated_at
json.url todolist_url(todolist, format: :json)
