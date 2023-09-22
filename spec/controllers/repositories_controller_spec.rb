# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  describe 'GET #index' do
    context 'with a valid search term' do
      let(:valid_search_term) { 'ruby' }

      it 'assigns @search_term' do
        get :index, params: { search: valid_search_term }
        expect(assigns(:search_term)).to eq(valid_search_term)
      end

      it 'calls GithubRepositorySearchService' do
        expect(GithubRepositorySearchService).to receive(:new).with(valid_search_term).and_call_original
        get :index, params: { search: valid_search_term }
      end

      it 'assigns @repositories with search results' do
        allow_any_instance_of(GithubRepositorySearchService).to receive(:search).and_return(%w[repo1 repo2])
        get :index, params: { search: valid_search_term }
        expect(assigns(:repositories)).to eq(%w[repo1 repo2])
      end
    end

    context 'with no search term' do
      it 'does not assign @search_term' do
        get :index
        expect(assigns(:search_term)).to be_nil
      end

      it 'does not call GithubRepositorySearchService' do
        expect(GithubRepositorySearchService).not_to receive(:new)
        get :index
      end

      it 'does not assign @repositories' do
        get :index
        expect(assigns(:repositories)).to be_nil
      end
    end
  end
end
