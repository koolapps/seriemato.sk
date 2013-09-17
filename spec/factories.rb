require 'factory_girl'

FactoryGirl.define do
  factory :issue do
    sequence :name do |n| 
      "Issue ##{n}"
    end
    short_description "issue"
    long_description "issue issue"
    smt_limit 1
    solvers_limit 2
    factory :issue_with_picture do
      picture { picture_file }
    end
  end

  factory :category do
    sequence :name do |n|
      "Category #{n}"
    end
  end

  factory :smt do
    issue nil
  end
end
