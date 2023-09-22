# frozen_string_literal: true

# GithubRepositorySearchService provides a service for searching GitHub repositories.
class GithubRepositorySearchService
  def initialize(search_term)
    @search_term = search_term
  end

  def search(page = 1)
    return [] unless @search_term.present?

    Octokit.search_repositories(@search_term, page: page, per_page: 10).items
  end
end
