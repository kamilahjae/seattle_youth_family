require "httparty"

class Issue < ActiveRecord::Base
  def self.request
    response = HTTParty.get("https://data.seattle.gov/api/views/s3q4-fh73/rows.json?accessType=DOWNLOAD")
    r = response["data"].each {|i| i[-5..-1]}
    return r
    # an array of arrays
  end
 
  # return individual arrays from the array of arrays
  def self.create_issues
    request.each do |array|
      if array[-1] != nil
        date = array[-1]
        converted_date = DateTime.strptime("#{date}", "%s")
      end

      regex = /(\d+)/

      if regex.match(array[-2])
        org_name = "Group #{array[-2]}"
      elsif
        org_name = array[-2]
      end

      Issue.create(
      :category => array[-5],
      :sub_category => array[-4],
      :organization => org_name,
      :description => array[-3],
      :workshop_date => converted_date
      )

    end
  end
end
