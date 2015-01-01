class IssuesController < ApplicationController
  def index
    @issues = Issue.show_issues
  end
end
