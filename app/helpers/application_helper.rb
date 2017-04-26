module ApplicationHelper
  def admission_state(final)
    case final
    when true
      "Proje Tamamlanmış ve Gözden Geçirmede"
    when false || nil
      "Proje başvurusu yazım aşamasında"
    end
  end

  def consolidated_notes(review)
    note_fields = Review.attribute_names.grep(/^notes_for/).map { |r| r.to_sym }
    note_fields.each.map do |field|
      if review.send(field) != nil
        "<span><em><b>" + I18n.t("activerecord.attributes.review.#{field}") + "</b></em>" + ": " + review.send(field) + "</span><br>"
      end
    end.join(" ").html_safe
  end
end
