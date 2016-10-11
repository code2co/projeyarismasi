module ApplicationHelper
  def admission_state(final)
    case final
    when true
      "Proje Tamamlanmış ve Gözden Geçirmede"
    when false || nil
      "Proje başvurusu yazım aşamasında"
    end
  end
end
