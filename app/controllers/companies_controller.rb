class CompaniesController < ApplicationController
  def index
    render json: { data: Company.all }
  end

  def alphabetize
    render json: { data: Company.alphabetize }
  end

  def with_modern_plan
    render json: { data: Company.modern }
  end
end
