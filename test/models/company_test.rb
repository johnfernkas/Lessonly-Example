require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "should not create a company without a name" do
    company = Company.new(plan_level: :basic)
    assert_not company.save
  end

  test "should not create a company with a short name" do
    company = Company.new(name: SecureRandom.hex(1), plan_level: :basic)
    assert_not company.save
  end

  test "should not create a company with a long name" do
    company = Company.new(name: SecureRandom.hex(150), plan_level: :basic)
    assert_not company.save
  end

  test "should not create a company with an invalid plan" do
    assert_raises(ArgumentError) {
      Company.create(name: "Llama Industries, Inc.", plan_level: :llama)
    }
  end

  test "should create a company with a trial status date 30 days from now" do
    company = Company.create(name: "Llama Industries, Inc.", plan_level: :basic)
    expiration_date = 30.days.from_now.beginning_of_day
    assert_equal expiration_date, company.trial_status
  end

  test "should have two related lessons" do
    company = Company.create(name: "Llama Industries, Inc.", plan_level: :basic)
    lesson1 = Lesson.create(name: "Lesson 1", company_id: company.id)
    lesson2 = Lesson.create(name: "Lesson 2", company_id: company.id)
    assert_equal [lesson1, lesson2], company.lessons
  end
end
