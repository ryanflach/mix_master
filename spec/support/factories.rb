FactoryGirl.define do
  factory :artist do
    name        "Bob Marley"
    image_path  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    # factory :artist_with_songs do
    #   transient do
    #     title "Trenchtown Rock"
    #   end
    #
    #   after(:create) do |artist, evaluator|
    #     create_list(:artist, evaluator.title, artist: artist)
    #   end
    # end
  end

  factory :song do
    title "No Woman No Cry"
    # artist
  end
end
