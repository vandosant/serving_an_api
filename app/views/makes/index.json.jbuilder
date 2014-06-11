json._links do
  json.self do
    json.href makes_path
  end
end

json._embedded do
  json.makes do
    json.array! @makes do |make|
      json._links do
        json.self do
          json.href make_path(make)
        end
      end
      json.id make.id
      json.name make.name
    end
  end
end