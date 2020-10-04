class GeneratePdfService
  attr_accessor :published_date, :data, :pdf

  DEFAULT_HEADERS = %w[Agency Title Clicks].freeze
  BACKGROUND_COLOR = 'D3D3D3'.freeze

  def initialize(published_date, data)
    @published_date = published_date
    @data = data
    init_pdf
  end

  def init_pdf
    @pdf ||= Prawn::Document.new(info: { Title: "DATE - #{published_date}" })
  end

  def export_pdf!
    generate_pdf
  rescue Exception => e
    Rails.logger.info "Couldn't create report for : #{@published_date}"
    Rails.logger.error e.message
    false
  end

  def delete_pdf
    return unless File.exist?(file_path)

    File.delete(file_path)
  end

  private

  def generate_pdf
    pdf.text_box("Date #{published_date}", { align: :center, style: :bold })
    init_headers
    set_content
    add_content_to_pdf
    create_pdf
  end

  def set_content
    pdf.move_down 30
    @cells = [@headers]
    pdf_data.each do |row|
      @cells << [row.name, row.title, row.click_count]
    end
  end

  def pdf_data
    data.select('agencies.name', 'feeds.title', 'feeds.click_count')
  end

  def add_content_to_pdf
    pdf.table(@cells, header: true, column_widths: [120, 300, 60]) do
      @cells.min_width = 50
    end
    pdf.move_down 18
  end

  def create_pdf
    pdf.render_file file_path
  end

  def file_path
    "#{Rails.root}/public/#{file_name}"
  end

  def file_name
    "Report-#{published_date}.pdf"
  end

  def init_headers
    @headers = DEFAULT_HEADERS.each_with_object([]) do |header, object|
      object << { content: header, background_color: BACKGROUND_COLOR }
    end
  end
end
