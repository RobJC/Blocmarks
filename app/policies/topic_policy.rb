class TopicPolicy < ApplicationPolicy
    
  def index?
    true
  end
    
  def destroy?
    false
  end
  
  def update?
    user.present?
  end
  
  def edit?
    update?
  end
  
  def destroy?
    update?
  end

end