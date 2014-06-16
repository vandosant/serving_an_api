xml.apiResponse do
  xml.links do
    xml.self(href: makes_path)
  end
  xml.makes do
    @makes.each do |make|
      xml.make do
        xml.links do
          xml.self(href: makes_path(make))
        end
        xml.id make.id
        xml.name make.name
      end
    end
  end
end