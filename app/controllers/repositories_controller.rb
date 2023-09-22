# frozen_string_literal: true

# RepositoriesController handles the logic for displaying GitHub repository search results.
class RepositoriesController < ApplicationController
  def index
    @search_term = params[:search]
    @repositories = perform_search if @search_term.present?
  end

  private

  def perform_search
    GithubRepositorySearchService.new(@search_term).search
  end
end
