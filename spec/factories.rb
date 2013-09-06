require 'factory_girl'

FactoryGirl.define do
  factory :issue do
    name "Issue"
    short_description "issue"
    long_description "issue issue"
    smt_limit 1
    solvers_limit 2
  end
end
