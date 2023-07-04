class Task < ApplicationRecord

  state_machine :state, initial: :new_task do
    event :in_development do
      transition new_task: :in_development
    end

    event :in_qa do
      transition in_development: :in_qa
    end

    event :in_code_review do
      transition in_qa: :in_code_review
    end

    event :ready_for_release do
      transition in_code_review: :ready_for_release
      end

    event :released do
      transition ready_for_release: :released
    end

    event :archived do
      transaction %i[new_task released] => :archived
    end

    event :in_revision do
      transaction %i[in_qa ready_for_release] => :in_development
    end
  end
end
