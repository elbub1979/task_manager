class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }

  state_machine :state, initial: :new_task do
    event :to_development do
      transition %i[new_task in_qa ready_for_release] => :in_development
    end

    event :to_qa do
      transition in_development: :in_qa
    end

    event :to_code_review do
      transition in_qa: :in_code_review
    end

    event :prepare_for_release do
      transition in_code_review: :ready_for_release
      end

    event :release do
      transition ready_for_release: :released
    end

    event :archive do
      transition %i[new_task released] => :archived
    end
  end
end
