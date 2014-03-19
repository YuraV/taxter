module UsersHelper
  def display_errors(object, field)
    if object.errors[field].any?
      content_tag :div, "", class: "error-message" do
        content_tag :p, "#{field.to_s} #{object.errors[field].first}".humanize, class: "error"
      end
    end
  end


  def edit_user_link(user)
    current_user = User.new unless current_user
    user.id != current_user.id ? edit_user_path(user) : edit_user_registration_path
  end

  def edit_user_link_render(user)
    link_to("Edit", edit_user_link(user))
  end

  def td_content_tag(link)
    content_tag :td do
      link
    end
  end

  def td_user_crud_action_links(resource, action)
    if action == :edit
      td_content_tag(edit_user_link_render(resource)) if can? :update, @user
    elsif action == :show
      td_content_tag(link_to "Show", user_path(resource)) if can? :read, @user
    elsif action == :destroy || :delete
      td_content_tag(link_to "Destroy", user_path(resource), method: :delete, confirm: "Are You Sure ?") if can? :destroy, @user
    end
  end
end
