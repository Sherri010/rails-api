require "rails_helper"
describe "USER API TESTS" do
  it "GET/api/users should return 200" do
     get "/users"
     expect(response).to have_http_status(200)
  end

  it "POST/api/users should return 201" do
     post "/users",params:{
       user:{
         first_name: "Bar",
         last_name:"foo",
         username:"boofar",
         email:"boofar@gmail.com"
       }
     }
     expect(response).to have_http_status(201)
  end

  it "POST/users should return 400 for missing value" do
    post "/users",params:{
      user:{
        last_name:"foo",
        username:"boofar",
        email:"boofar@gmail.com"
      }
    }
    expect(response).to have_http_status(400)
  end
end
