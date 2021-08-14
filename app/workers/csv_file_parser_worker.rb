class CsvFileParserWorker
    require 'csv'
    require 'open-uri'
    include Sidekiq::Worker
    sidekiq_options retry: false
    require 'credit_card_validations/string'

    def perform(csv_id, url)
        csv = CsvFile.find(csv_id)
        user = csv.user
        logs = "\n"
        file = open(url) {|f| f.read}
        csv_parsed = CSV.parse(file, headers: false)
        ActiveRecord::Base.transaction do
            csv_parsed.each_with_index do |row, index|
                data = build_contact_data(row, csv.order).with_indifferent_access
                contact = Contact.new(data.merge(card_franchise: data[:credit_card].credit_card_brand_name, user_id: user.id))
                logs += "Row #{index+1}, #{contact.errors.messages} \n" if !contact.save
            end
        end
        logs == "" ? csv.update(state: 3) : csv.update(logs: logs, state: 2)
    end

    def build_contact_data(row, csv_order)
        data = {}
        csv_order.each_with_index {|order, index | data[order] = row[index].strip}
        data
    end
end