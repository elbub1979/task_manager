class Task < ApplicationRecord

  state_machine :state, initial: :new_task do
    event :develop do
      transition %i[new_task in_qa ready_for_release] => :in_development
    end

    event :testing do
      transition in_development: :in_qa
    end

    event :review_the_code do
      transition in_qa: :in_code_review
    end

    event :prepare_for_release do
      transition in_code_review: :ready_for_release
      end

    event :release do
      transition ready_for_release: :released
    end

    event :archive do
      transaction %i[new_task released] => :archived
    end
  end
end
