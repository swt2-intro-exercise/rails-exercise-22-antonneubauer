FactoryBot.define do
  factory :author do
    first_name { 'Alan' }
    last_name { 'Turing' }
    homepage { 'http://wikipedia.de/Alan_Turing' }
  end

  factory :invalide_author do
    first_name { 'Alan' }
    last_name { '' }
    homepage { 'http://wikipedia.de/Alan_Turing' }
  end
end
