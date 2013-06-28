require 'test_helper'

class QueryTest < ActiveSupport::TestCase

    obj = self

    # before all
    def self.startup
      DatabaseCleaner.strategy = :truncation, {:only => tables}

      obj.use_transactional_fixtures = false
      ThinkingSphinx::Test.create_indexes_folder
      ThinkingSphinx::Test.start
    end

    # before each
    def setup
      DatabaseCleaner.start
    end

    # after each
    def teardown
       DatabaseCleaner.stop
    end

    # after all
    def self.shutdown
      ThinkingSphinx::Test.stop
      DatabaseCleaner.strategy = :transaction
      obj.use_transactional_fixtures = true
    end


    # ---------------


    test "search query gets results" do  
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
        get :index
            :query => 'dave@yahoo.com'
        
        assert [@article], assigns[:articles]
      end
    end


end
