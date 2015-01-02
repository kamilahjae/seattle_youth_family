class IssuesController < ApplicationController
  def index
    @categories = Issue.show_categories
    @sub_categories = Issue.show_sub_categories
    @organizations = Issue.show_organizations
    @issues = Issue.show_issues
    @dates = [1,2,3,4,5]
  end
end
