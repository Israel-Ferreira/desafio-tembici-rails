web: bundle exec bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
release: bin/rails  db:migrate && rails db:seed
