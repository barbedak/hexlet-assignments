# frozen_string_literal: true

10.times do
  Task.create(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs.join("\n\n"),
    creator: Faker::Name.unique.name,
    performer: Faker::Name.unique.name,
    completed: false,
    status: 'New'
  )
end
