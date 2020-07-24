# frozen_string_literal: true

namespace :release do
  task prepare_env: :environment do
    tasks = [
      { command: 'db:setup' },
      { command: 'db:seed' }
    ]

    tasks.each { |task| `rails #{task[:command]}` }
  end
end
