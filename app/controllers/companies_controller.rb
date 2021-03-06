class CompaniesController < ApplicationController
  def index
    render json: { data: Company.all }
  end

  def alphabetically
    render json: { data: Company.alphabetize }
  end

  def with_modern_plan
    render json: { data: Company.modern }
  end

  def not_trialing
    render json: { data: Company.not_trialing }
  end

  def created_last_month
    render json: { data: Company.created_last_month }
  end
end
