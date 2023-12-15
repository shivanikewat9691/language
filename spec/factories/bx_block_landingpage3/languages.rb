FactoryBot.define do
  factory :language, class: BxBlockLandingpage3::Language do
    language_name {"German"}
    logo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'images', 'german.png'), 'image/png') }
  end
end