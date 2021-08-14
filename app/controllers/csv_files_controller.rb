class CsvFilesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        response = false
        csv = CsvFile.new(csv_file_params)
        if csv.save
            response = true
            CsvFileParserWorker.perform_async(csv.id)
        end
        render status: 200, json: {created: response}
    end

    private

    def csv_file_params
        params.require(:csv_file).permit(:user_id. :file, :order)
    end
end