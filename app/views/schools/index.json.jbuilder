json.array!(@schools) do |school|
  json.extract! school, :id, :name,:phone, :email, :ownership, :level, :mode, :gender, :about
  json.url school_url(school, format: :json)
end
