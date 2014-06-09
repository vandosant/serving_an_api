module ObjectCreationMethods
  def create_user(attributes = {})
    defaults = {}
    User.create!(attributes.merge(defaults))
  end
end