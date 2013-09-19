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
    factory :issue_with_smts do
      ignore do
        smts_count 3
      end
      after(:create) do |issue, evaluator|
        FactoryGirl.create_list(:smt, evaluator.smts_count, issue: issue)
      end
    end
  end

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

  factory :smt do
    issue nil
  end
end
