require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "should not create a lesson without a name" do
    company = Company.create(name: "Llama Industries, Inc.", plan_level: :basic)
    lesson = Lesson.new(company_id: company.id)
    assert_not lesson.save
  end

  test "should not create a lesson with non-alphanumeric name" do
    lesson = Lesson.new(name: SecureRandom.base64)
    assert_not lesson.save
  end

  test "should not create a lesson without company id" do
    lesson = Lesson.new(name: "Llama Lesson")
    assert_not lesson.save
  end

  test "should have one related company" do
    company = Company.create(name: "Llama Industries, Inc.", plan_level: :basic)
    lesson = Lesson.new(name: "Llama Lesson", company_id: company.id)
    assert_equal company, lesson.company
  end
end
