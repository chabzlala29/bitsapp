module ApplicationHelper
  def activities_count
    count = current_user.activities.count
    "#{count} #{'activity'.pluralize((count == 0)? 1 : count)}"
  end
end
