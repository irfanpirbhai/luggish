class List < ActiveRecord::Base
attr_accessible :name, :location, :sex, :start_date, :end_date, :item_lists, :item_lists_attributes

  belongs_to :user
  has_many :item_lists, :dependent => :destroy
  has_many :items, through: :item_lists
	
  validates :name, presence: true, length: {maximum: 100}
  validates :location, presence: true, length: {maximum: 255}
  validates :sex, presence: true

  accepts_nested_attributes_for :item_lists, :reject_if => :all_blank, :allow_destroy =>true
 # accepts_nested_attributes_for :item_lists

  def convertDate(startDate,endDate)
  	self.start_date = Date.strptime(startDate, '%m/%d/%Y')
    self.end_date =Date.strptime(endDate, '%m/%d/%Y')
  end

end
  