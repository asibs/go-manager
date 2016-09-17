module ApplicationHelper

  # Use I18n to get shorter versions of a translation (eg. to display in drop downs, etc)
  # The 'SHORT_' version of the phrase must be present in the locales file
  def short_t(s)
    return t("SHORT_" + s)
  end

end
