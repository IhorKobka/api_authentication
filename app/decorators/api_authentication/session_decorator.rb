class ApiAuthentication::SessionDecorator < Draper::Decorator
  delegate_all

  decorates_association :user, with: proc { |_| defined?(UserDecorator) ? UserDecorator : ApiAuthentication::UserDecorator }

  def as_json *args
    {
      token: token,
      user:  user
    }
  end
end
