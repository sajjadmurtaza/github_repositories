# frozen_string_literal: true

# spec/services/github_repository_search_service_spec.rb

require 'rails_helper'

RSpec.describe GithubRepositorySearchService, type: :service do
  describe '#search' do
    let(:search_term) { 'ruby' }
    let(:service) { described_class.new(search_term) }

    context 'when search term is present' do
      it 'calls Octokit.search_repositories with the correct arguments' do
        expect(Octokit).to receive(:search_repositories)
          .with(search_term, hash_including(page: 1, per_page: 10))
          .and_return(double(items: []))

        service.search
      end

      it 'returns search results' do
        expected_results = [double(name: 'repo1'), double(name: 'repo2')]
        allow(Octokit).to receive(:search_repositories)
          .and_return(double(items: expected_results))

        results = service.search

        expect(results).to eq(expected_results)
      end
    end

    context 'when search term is empty' do
      let(:search_term) { '' }

      it 'does not call Octokit.search_repositories' do
        expect(Octokit).not_to receive(:search_repositories)

        service.search
      end

      it 'returns an empty array' do
        results = service.search

        expect(results).to eq([])
      end
    end
  end
end
