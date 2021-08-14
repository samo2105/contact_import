class CsvFileParserWorker
    require 'csv'
    require 'open-uri'
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(csv_id)
        csv = CsvFile.find(csv_id)
        csv_file = csv.file
        user = csv.user
        logs = ""
        url = Rails.application.routes.url_helpers.rails_blob_path(csv_file, only_path: true)
        url_file = open(url) {|f| f.read}
        csv_parsed = CSV.parse(url_file, headers: false)
        ActiveRecord::Base.transaction do
            csv_parsed.each_with_index do |row, index|
                data = build_contact_data(row, csv.order).with_indifferent_access
                contact = Contact.new(*data, card_franchise: data[:credit_card].credit_card_brand_name, user_id: user.id)
                logs.append("Row #{index+1}, #{contact.errors.messages} \n") if !contact.save
            end
        end
        logs == "" ? csv.update(state: 3) : csv.update(logs: logs, state: 2)
    end

    def build_contact_data(row, csv_order)
        data = {}
        csv_order.each {|order| data[order[0]] = row[0]}
        data
    end
end