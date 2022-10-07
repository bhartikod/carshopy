class Profile < ApplicationRecord
  belongs_to :user

  after_save {first_name.downcase.titlize}
  after_save {last_name.downcase!}


end

  
