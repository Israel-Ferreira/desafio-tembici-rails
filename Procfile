web: bundle exec bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
migrate_db: bin/rails  db:migrate -e $RAILS_ENV 
seed: bin/rails db:seed -e $RAILS_ENV