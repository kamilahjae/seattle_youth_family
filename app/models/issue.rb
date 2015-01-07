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

  def self.show_descriptions
    descrips = []
    request.each do |i|
      descrips << i[-3]
    end
    return descrips
  end

  def self.numbered(descriptions)
    descriptions.each do |descrip|
      (1..1202).each do |number|
        @numbered_descrip = puts "#{number} #{descrip}"
      end
    end
    return @numbered_decrip
  end

  def self.show_dates
    dates = []
    request.each do |i|
       dates << i[-1].to_s
      #  final_date = DateTime.strptime(date, "%s")
    end
    # new_dates = dates.delete_if {|date| date == (/"\"\""/)}
    # return new_dates
    return dates
  end

  # def self.convert_dates_to_datetime(dates)
  #   datetime_obj = []
  #
  #   dates.each do |date|
  #       converted_date = DateTime.strptime(date, "%s")
  #       datetime_obj << converted_date
  #   end
  # end

  #create single objects instead?
  def self.category
    show_categories.each do |category|
      @category = category
    end
    return @category
  end

  def self.sub_category
    show_sub_categories.each do |sub_category|
      @sub_category = sub_category
    end
    return @sub_category
  end

  def self.organization
    show_organizations.each do |organization|
      @organization = organization
    end
    return @organization
  end

  def self.description
    show_descriptions.each do |description|
      @description = description
    end
    return @decription
  end

  def self.workshop_date
    show_dates.each do |workshop_date|
      @workshop_date = workshop_date
    end
    return @workshop_date
  end

  def self.create_issue
    Issue.create(
    :category => self.category,
    :sub_category => self.sub_category,
    :organization => self.organization,
    :description => self.description,
    :workshop_date => self.workshop_date
    )
  end
end
