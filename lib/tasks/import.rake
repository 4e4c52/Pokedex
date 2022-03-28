# frozen_string_literal: true

namespace :import do
  desc 'Import Pokemon Types into the database'
  task types: :environment do
    Importers::Types.import
  end
end
