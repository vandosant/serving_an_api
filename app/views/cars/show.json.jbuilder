if @car
  json._links do
    json.self do
      json.href car_path(@car)
    end
    json.make do
      json.href make_path(@car.make)
    end
  end
  json.color @car.color
  json.doors @car.doors
  json.id @car.id
  json.purchased_on @car.purchased_on
end