json._links do
  json.self do
    json.href make_path(@make)
  end
end

json.id @make.id
json.name @make.name