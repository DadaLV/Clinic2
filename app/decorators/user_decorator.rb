class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def full_name_with_category
    if object.category.present?
      "#{object.full_name} - #{object.category.name}"
    else
      object.full_name
    end
  end
  
end
