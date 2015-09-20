# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  validates :title, :url, presence: true

  has_many :comments

  def new
    @link = Link.new
    render :new
  end

  def self.find_by_credentials(credentials)
    link = Link.find_by_title_and_url(credentials[:title], credentials[:url])
    return nil unless link
    link
  end
end
