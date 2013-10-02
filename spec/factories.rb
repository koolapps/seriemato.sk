require 'factory_girl'

FactoryGirl.define do
  factory :category do
    sequence :name do |n|
      "Category #{n}"
    end
    factory :category_with_issues do
      ignore do
        issues_count 3
      end
      after(:create) do |category, evaluator|
        FactoryGirl.create_list(:issue, evaluator.issues_count, category: category)
      end
    end
  end

  factory :issue do
    sequence :name do |n| 
      "Issue ##{n}"
    end
    short_description "issue"
    long_description "issue issue"
    smt_limit 1
    solvers_limit 2
    category
    factory :issue_with_picture do
      picture { picture_file }
    end
    factory :issue_with_smts do
      ignore do
        smts_count 3
      end
      after(:create) do |issue, evaluator|
        FactoryGirl.create_list(:smt, evaluator.smts_count, issue: issue)
      end
    end
    factory :issue_with_solvers do
      ignore do
        solvers_count 3
      end
      after(:create) do |issue, evaluator|
        FactoryGirl.create_list(:solver, evaluator.solvers_count, issue: issue)
      end
    end
  end

  factory :smt do
    issue nil
  end

  factory :solver do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@example.com'
    issue nil
  end
end
