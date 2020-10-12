class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prifecture
  
  belongs_to :order 

end
