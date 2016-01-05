Fabricator(:user) do
  email { Faker::Internet.email }
  password "quandoeuviromeubone"
  password_confirmation "quandoeuviromeubone"
end

Fabricator(:user_locke, from: :user) do
end
