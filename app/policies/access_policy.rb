class AccessPolicy
  include AccessGranted::Policy
  def configure
    role :admin, proc { |user| user.admin? } do
      can :manage, User
      can :manage, Admission
      can :manage, Review
    end

    role :reviewer, proc { |user| user.reviewer? } do
      can :create, Review
      can [:read, :update, :destroy], Review do |review, user|
        review.user == user
      end
    end

    role :applicant, proc { |user| user.applicant? } do
      can :create, Admission
      can [:read, :update, :destroy], Admission do |admission, user|
        admission.user == user
      end
    end

    role :guest do
     can :read, Admission, { final: true }
    end
  end
end
