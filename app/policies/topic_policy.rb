class TopicPolicy < ApplicationPolicy
    
  def index?
    true
  end
    
  def destroy?
    false
  end

end