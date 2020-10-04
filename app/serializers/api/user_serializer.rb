# frozen_string_literal: true

module Api
  class UserSerializer < Api::BaseSerializer
    attributes :id, :first_name, :last_name, :email
  end
end
