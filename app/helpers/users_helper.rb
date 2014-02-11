module UsersHelper
  def display_errors(object, field)
    if object.errors[field].any?
      content_tag :div, "", class: "error-message" do
        content_tag :p, "#{field.to_s} #{object.errors[field].first}".humanize, class: "error"
      end
    end
  end


  def edit_user_link(user)
    user.id != current_user.id ? edit_user_path(user) : edit_user_registration_path
  end

  def render_link_to_edit(user)
    link_to("Edit", edit_user_link(user))
  end

end
