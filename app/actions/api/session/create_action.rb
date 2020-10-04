# frozen_string_literal: true

module Api
  class Session::CreateAction < Abstract::BaseAction
    attr_accessor :token

    def perform
      @success = generate_token!
    end

    def generate_token!
      return fail_with_error(422, :session, I18n.t('session.invalid_email')) unless record

      if record.authenticate(params[:password])
        @token = record.generate_token
      else
        fail_with_error(422, :session, I18n.t('session.invalid_password'))
      end
    end

    def record
      @record ||= ::User.find_by(email: params[:email])
    end

    def data
      {
        data: {
          token: token,
          id: record.id,
          first_name: record.first_name,
          last_name: record.last_name,
          email: record.email
        },
        success: true
      }
    end
  end
end
