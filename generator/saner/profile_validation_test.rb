# frozen_string_literal: true

module Inferno
  module Generator
    module ProfileValidationTest
      def create_profile_validation_test(sequence)
        test_key = :validate_resources
        search_test = {
          tests_that: "#{sequence[:resource]} resources returned from previous search conform to the #{sequence[:profile_name]}.",
          key: test_key,
          index: sequence[:tests].length + 1,
          description: %()
        }
        search_test[:test_code] = %(
          test_resources_against_profile('#{sequence[:resource]}')
        )
        sequence[:tests] << search_test
      end
    end
  end
end
