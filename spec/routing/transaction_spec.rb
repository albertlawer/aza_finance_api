require 'rails_helper'

RSpec.describe '/transactions routes' do
  it "routes to the index" do
    expect(get '/transactions').to route_to("transactions#index")
  end
  
  it "routes to the show" do
    expect(get '/transactions/1').to route_to("transactions#show", id: "1")
  end
  
  it "routes to the create" do
    expect(post '/transactions').to route_to("transactions#create")
  end
end
