class IssuesController < ApplicationController
  def index
    @issue = Issue.create_issues
    issue_attributes

    render json: @issue
  end

  def show
    #create an empty hash to pass in parameters based on conditions of nil
    # Parameters: {"date"=>"2010-04-07 07:00:00 UTC", "organization"=>"Somali community", "category"=>"Health"}
    params_hash = {}
    # if params[:organization] != nil
      params_hash[:organization] = params[:organization]
    # elsif params[:date] != nil
      params_hash[:workshop_date] = params[:date]
    # elsif params[:category] != nil
      params_hash[:category] = params[:category]
    # end

    @issues = Issue.where(params_hash)

    puts "This is what issues returns: #{@issues.to_a}"

    issue_attributes

    dropdown_arrays

    #respond to html and json to have objects on same page:
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issues }
    end
  end

  def dropdown_arrays
    issue_attributes

    @organization_array = []
    @organizations.each do |organization|
      @organization_array << organization
    end

    @date_array = []
    @show_dates.each do |date|
      @date_array << date
    end

    @category_array = []
    @categories.each do |category|
      @category_array << category
    end

  end

  def issue_attributes
    @categories     = Issue.pluck(:category).uniq.sort_by{|word| word.upcase}
    @sub_categories = Issue.pluck(:sub_category).uniq.sort_by{|word| word.upcase}
    @organizations  = Issue.pluck(:organization).uniq
    @descriptions   = Issue.pluck(:description)
    @show_dates     = Issue.pluck(:workshop_date).uniq
  end
end
