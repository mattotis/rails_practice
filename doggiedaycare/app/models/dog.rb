class Dog < ActiveRecord::Base
  #belongs_to always goes in the table that contains the foreign key
  belongs_to :owner
end
