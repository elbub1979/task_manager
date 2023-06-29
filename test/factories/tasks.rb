FactoryBot.define do
  factory :task do
    name
    description { "Description" }
    author_id { 1 }
    assignee_id { 1 }
    state { "new_task" }
    expired_at
  end
end
