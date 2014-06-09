require 'rails_helper'

describe User do
  it 'generates a API token on creation' do
    user = create_user

    expect(user.api_authentication_token).to_not be_nil
  end
end
