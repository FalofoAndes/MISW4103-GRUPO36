Feature: Create Page in Ghost
  As an user I want to create page to share my content 

@user1 @web
Scenario Outline: Create Page in Ghost with bad date
  Given I navigate to page "<URL>"
  And I login "<USERNAME1>" "<PASSWORD1>"
  When I navigate to page "<URL_PAGES>"
  And I wait for 1 seconds
  And I click view with selector ".ember-view.gh-btn.gh-btn-primary.view-actions-top-row"
  And I wait for 1 seconds
  And I click view with selector ".settings-menu-toggle.gh-btn.gh-btn-editor.gh-btn-icon.icon-only.gh-btn-action-icon"
  And I wait for 1 seconds
  And I click view with selector ".gh-date-time-picker-date"
  And I enter text "5"
  And I click view with selector ".gh-date-time-picker-time"
  Then I confirm that the error "Invalid date format" in date picker is shown

@user2 @web
Scenario Outline: Create Page in Ghost without authors
  Given I navigate to page "<URL>"
  And I login "<USERNAME1>" "<PASSWORD1>"
  When I navigate to page "<URL_PAGES>"
  And I wait for 1 seconds
  And I click view with selector ".ember-view.gh-btn.gh-btn-primary.view-actions-top-row"
  And I wait for 1 seconds
  And I click view with selector ".settings-menu-toggle.gh-btn.gh-btn-editor.gh-btn-icon.icon-only.gh-btn-action-icon"
  And I delete author tag
  And I wait for 1 seconds
  Then I confirm that the error "At least one author is required" in Authors is shown

@user3 @web
Scenario Outline: Create Page in Ghost without title and with content
  Given I navigate to page "<URL>"
  And I login "<USERNAME1>" "<PASSWORD1>"
  When I navigate to page "<URL_PAGES>"
  And I wait for 2 seconds
  And I click view with selector ".ember-view.gh-btn.gh-btn-primary.view-actions-top-row"
  And I wait for 1 seconds
  And I click view with selector ".koenig-editor__editor.__mobiledoc-editor.__has-no-content"
  And I enter text "Page Content"
  And I wait for 2 seconds
  And I clic in back button
  And I wait for 2 seconds
  Then I see the first page in list with name untitled

@user4 @web
Scenario Outline: Create a page sucesfully and verify that the page title contains the title
  Given I navigate to page "<URL>"
  And I login "<USERNAME1>" "<PASSWORD1>"
  When I navigate to page "<URL_PAGES>"
  And I wait for 2 seconds
  And I click view with selector ".ember-view.gh-btn.gh-btn-primary.view-actions-top-row"
  And I wait for 2 seconds
  And I click view with selector ".gh-editor-title.ember-text-area.gh-input.ember-view"
  And I enter text "Title"
  And I wait for 2 seconds
  And I click view with selector ".koenig-editor__editor.__mobiledoc-editor.__has-no-content"
  And I enter text "Content"
  And I wait for 2 seconds
  And I clic in back button
  And I wait for 2 seconds
  And I click view with selector "li.gh-list-row.gh-posts-list-item a.gh-list-data.gh-post-list-title"
  And I wait for 2 seconds
  Then I confirm that the title page contains the inserted title "Title"