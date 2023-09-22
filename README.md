![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/f2.gif "flow gif Screenshot")

# github_repositories

Ruby Version: 3.0.0

Rails Version: 7.0.1

GitHub Repositories Search is a Ruby on Rails application that enables users to search and discover GitHub repositories based on keywords, providing essential repository details and links for easy exploration.

### Key files

    
    app
    ├── controller                     
    │      └── repositories_controller  
    │
    |
    ├── services
    |      └── github_repository_search_service.rb 
    |
    └──  views
            └── repositories (_search_form, _repository_card, index)
    

### Workflow - How does it work?

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/p.png "flow Screenshot")

* Enter Search Query: Users can input a search query, e.g. a GitHub repository name, into the search bar on the home page.
* Search Execution: When the user submits the search query, the application sends a GET request to the GitHub API using the provided query.
* Retrieve Repository Data: The application receives a response from the GitHub API, which contains a list of repositories matching the search query.
* Display Results: The retrieved repositories are displayed as cards on the search results page, showing essential details such as repository name, owner's username, description, programming language, star count, and fork count etc.
* Visit Repository: Users can click on the "Visit Repository" button within each card to navigate to the respective GitHub repository on GitHub's website.
No Results Message: If no repositories match the search query, the application displays a message indicating that no repositories were found.


***
**Setup**

* first clone the directory 
                      ```
                      git clone git@github.com:sajjadmurtaza/github_repositories.git
                      ```
 *  ```cd github_repositories```

 *  ```bundle install ```

 *  ```rails s ```

 * add GITHUB_ACCESS_TOKEN to config/initializers/octokit.rb (if needed.)
 
 ***


### Specs

run ``` bundle exe rspec   ``` to run the tests

#### Note
I used the following gems for this challenge.

* [octokit](https://github.com/octokit/octokit.rb) - Ruby toolkit for the GitHub API
* [rspec-rails](https://github.com/rspec/rspec-rails) - testing framework
* rails-controller-testing
