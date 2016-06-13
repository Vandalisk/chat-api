FactoryGirl.define do
  factory :message do
    body { FFaker::Lorem.paragraph }
    sender
    receiver
  end
end
