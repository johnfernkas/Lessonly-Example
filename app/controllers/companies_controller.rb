class CompaniesController < ApplicationController
  def index
    render json: { data: Company.all }
  end

  def alphabetize
    render json: { data: Company.alphabetize }
  end
end
