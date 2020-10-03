# frozen_string_literal: true

module Api
  class AgencySerializer < Api::BaseSerializer
    attributes :id, :name, :logo_path
  end
end
