require_relative '../app'
require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../rental'
require 'json'
require 'rspec'

RSpec.describe DataManager do
  let(:app) { double('app') }
  let(:data_manager) { DataManager.new(app) }
  let(:people) { [] }
  let(:books) { [] }
  let(:rentals) { [] }

  before do
    allow(app).to receive(:people).and_return(people)
    allow(app).to receive(:books).and_return(books)
    allow(app).to receive(:rentals).and_return(rentals)
  end
  
  describe '#load_from_json' do
    it 'returns an empty array if the file does not exist' do
      filename = 'nonexistent.json'

      loaded_data = data_manager.load_from_json(filename)

      expect(loaded_data).to eq([])
    end
  end
end
