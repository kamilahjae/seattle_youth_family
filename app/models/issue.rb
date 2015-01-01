require "httparty"

class Issue < ActiveRecord::Base
  def self.request
    response = HTTParty.get("https://data.seattle.gov/api/views/s3q4-fh73/rows.json?accessType=DOWNLOAD")
    r = response["data"].each {|i| i[-5..-1]}
    return r
    # an array of arrays
  end

  def self.show_categories
    categories = []
    request.each do |i|
      categories << i[-5]
    end
    return categories
  end

  def self.show_sub_categories
    sub_categories = []
    request.each do |i|
      sub_categories << i[-4]
    end
    return sub_categories
  end

  def self.show_organizations
    organizations = []
    request.each do |i|
      organizations << i[-2]
    end
    return organizations
  end

  def self.show_issues
    issues = []
    request.each do |i|
      issues << i[-3]
    end
    return issues
  end

  def self.numbered_issues(issues)
    issues.each do |issue|
      (1..1202).each do |number|
        @numbered_issues = puts "#{number} #{issue}"
      end
    end
    return @numbered_issues
  end
end
