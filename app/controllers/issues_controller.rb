class IssuesController < ApplicationController
  def index
    Issue.create_issue

    @categories     = Issue.show_categories
    @sub_categories = Issue.show_sub_categories
    @organizations  = Issue.show_organizations
    @descriptions   = Issue.show_descriptions

    @show_dates = Issue.show_dates
    # @dates      = Issue.convert_dates_to_datetime(@show_dates)
  end

  def issue_params
    params.require(:issue).permit(
    :category,
    :sub_category,
    :organization,
    :description,
    :workshop_date,
    )
  end
end
