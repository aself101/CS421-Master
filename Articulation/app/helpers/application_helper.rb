module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "University of Hawaii at Hilo"
    if page_title.empty?                # test if it is empty
      base_title                        # return base title
    else
      "#{base_title} | #{page_title}"   # use string interpolation
    end
  end
end
