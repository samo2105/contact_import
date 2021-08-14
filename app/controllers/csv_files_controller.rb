class CsvFilesController < ApplicationController
    before_action :authenticate_user!

    def index
        @files = current_user.csv_files
        @select_fields = [
            [ :name, :name],
            [ :dob, :dob],
            [ :phone, :phone],
            [ :address, :address],
            [ :credit_card, :credit_card],
            [ :email, :email],
        ]
        @new_csv = CsvFile.new
    end
    
    def create
        response = false
        csv = current_user.csv_files.new(csv_file_params)
        if csv.save
            response = true
            CsvFileParserWorker.perform_async(csv.id, url_for(csv.file))
        else
            redirect_to csv_files_path, alert: "Error uploading file #{csv.errors.messages}"
        end
    end

    private

    def csv_file_params
        params.require(:csv_file).permit(:file, order: [])
    end
end