class IssuesController < ApplicationController
  def index
    @issue = Issue.create_issues
    issue_attributes

    render json: @issue
  end

  def show
    issue_attributes
  end

  def issue_attributes
    @categories     = Issue.pluck(:category).uniq.sort_by{|word| word.upcase}
    @sub_categories = Issue.pluck(:sub_category).uniq.sort_by{|word| word.upcase}
    @organizations  = Issue.pluck(:organization).uniq
    @descriptions   = Issue.pluck(:description)
    @show_dates     = Issue.pluck(:workshop_date).uniq
  end
end
