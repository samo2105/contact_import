class CsvFileParserWorker
    require 'csv'
    require 'open-uri'
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(csv_id, csv_order)
        csv = CsvFile.find(csv_id)
        csv_file = csv.file
        #csv_parsed = CSV.parse(csv_file, headers: false)
        #csv_parsed.each do |row|
        #    #CSV logic
        #end
    end
end