class Debt < ActiveRecord::Base
attr_accessible :amount, :expirity, :friend_id, :type, :user_id, :status  
  
  validates :amount, :numericality => { :greater_than_or_equal_to => 0}, :presence => true
  validates :friend_id, :presence => true
  validates :expirity, :presence => true
  
 D_TYPES = [['Borrow', '1'], ['Lend', '2']]
 D_STATS = [['Outstanding', '0'], ['Paid', '1']]
  

  
  
end
