require_relative '../main'
require 'rspec'

RSpec.describe Main do
  let(:app) { instance_double(App) }
  let(:menu) { instance_double(Menu) }
  let(:main) { Main.new }

  before do
    allow(App).to receive(:new).and_return(app)
    allow(Menu).to receive(:new).with(app).and_return(menu)
    allow(app).to receive(:load_data_from_files)
    allow(menu).to receive(:display)
    allow(menu).to receive(:process_choice)
  end

  describe '#run' do
    it 'loads data from files' do
      expect(app).to receive(:load_data_from_files)

      main.run
    end

    it 'displays the menu' do
      expect(menu).to receive(:display)

      main.run
    end

    it 'processes the user choice' do
      expect(menu).to receive(:process_choice).and_return(false)

      main.run
    end
  end
end