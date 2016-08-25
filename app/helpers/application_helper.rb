module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)

    base_title = "Re-Vive Customer Platform"

    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end

  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when :alert   then "alert-error"
    when :notice  then "alert-success"
    end
  end

end

