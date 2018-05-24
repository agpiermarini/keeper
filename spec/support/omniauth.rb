def stub_auth
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
    {
     "provider"=>"twitter",
     "uid"=>"809075773105721344",
     "info"=>
      {"nickname"=>"agpiermarini",
       "name"=>"↟Aɴᴅʀeᴡ",
       "email"=>nil,
       "location"=>"",
       "image"=>"http://pbs.twimg.com/profile_images/968045861958635520/LxDeesSo_normal.jpg",
       "description"=>"🍃",
       "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/agpiermarini"}},
     "credentials"=>{"token"=>ENV["twitter_oauth_token"], "secret"=>ENV["twitter_oauth_secret"]
     }
    }
  )
end
