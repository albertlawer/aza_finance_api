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
  
  it "routes to the update" do
    expect(put '/transactions/1').to route_to("transactions#update", id: "1")
    expect(patch '/transactions/1').to route_to("transactions#update", id: "1")
  end
end
