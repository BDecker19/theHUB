require 'test_helper'

class QueryTest < ActiveSupport::TestCase

    obj = self


    # module SphinxHelpers
    #   def index
    #     ThinkingSphinx::Test.index
    #     # Wait for Sphinx to finish loading in the new index files.
    #     sleep 0.25 until index_finished?
    #   end

    #   def index_finished?
    #     Dir[Rails.root.join(ThinkingSphinx::Test.config.searchd_file_path, '*.{new,tmp}.*')].empty?
    #   end
    # end


    # # ---------------


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
       DatabaseCleaner.clean
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
        @user = users(:Dave)
        @user.save 

        ThinkingSphinx::Test.index
        @query_results = User.search "dave"

        assert_equal(@query_results[0].email, "dave@yahoo.com")

      end
    end


end
