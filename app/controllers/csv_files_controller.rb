class CsvFilesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        response = false
        csv = CsvFile.new(csv_file_params)
        if csv.save
            response = true
            csv_order = params[:csv_file][:order]
            CsvFileParserWorker.perform_async(csv.id, csv_order)
        end
        render status: 200, json: {created: response}
    end

    private

    def csv_file_params
        params.require(:csv_file).permit(:user_id. :file)
    end
end