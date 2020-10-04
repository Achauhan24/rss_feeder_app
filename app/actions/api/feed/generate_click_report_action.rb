# frozen_string_literal: true

module Api
  class Feed::GenerateClickReportAction < Feed::ClickReportAction
    def perform
      @success = generate_report!
    end

    def generate_report!
      GeneratePdfService.new(params[:date], records).export_pdf!
    end

    def data
      {
        pdf: Rails.root.join('public', "Report-#{params[:date]}.pdf")
      }
    end
  end
end
