require 'rails_helper'

RSpec.describe CsvFilesController, type: :controller do

    describe 'create' do
        login_user
        let(:user) {create(:user)}
        let(:csv) {build(:csv_file)}

        it 'it should create a CsvFile' do
            ActiveJob::Base.queue_adapter = :test
            file = fixture_file_upload('test/fixture_files/pruebas.csv','text/csv')
            params = {
                csv_file: {
                    file: file,
                    order: csv.order
                }
            }
            post :create, params: params
            assert_equal "default", CsvFileParserWorker.queue_as
            expect(CsvFile.last.order).to eq(csv.order)
            expect(response.code).to eq('302')
        end
    end

end