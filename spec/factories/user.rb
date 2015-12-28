FactoryGirl.define do
  factory :user do
    username     'jhon'
    provider     'twitter'
    uid          '12345'
    oauth_token  'asdfqwer12345678'
    oauth_secret 'asdfqwer12345678'
  end
end

