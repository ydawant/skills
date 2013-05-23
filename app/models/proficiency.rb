class Proficiency < ActiveRecord::Base

belongs_to :user
belongs_to :skill

def formal_education=(value)
  if value.is_a? String
    @formal_education = value == "true"
  else
    @formal_education = value
  end
end

end
