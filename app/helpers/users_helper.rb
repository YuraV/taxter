module UsersHelper
  def display_errors(object, field)
    if object.errors[field].any?
      content_tag :div, "", class: "error-message" do
        content_tag :p, "#{field.to_s} #{object.errors[field].first}".humanize, class: "error"
      end
    end
  end
end
