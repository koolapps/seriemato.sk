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
  end

  factory :category do
    name 'Category'
  end
end
