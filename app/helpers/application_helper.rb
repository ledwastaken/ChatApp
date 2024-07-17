module ApplicationHelper
  def set_locale_link(locale)
    url_for(params.permit!.to_h.merge(locale: locale))
  end
end
