# frozen_string_literal: true

module Inferno
  module Generator
    module ReadTest
      def create_update_test(sequence, interaction)
        test_key = :resource_update
        create_test = {
          tests_that: "Server creates #{sequence[:resource]} resource with the #{sequence[:resource]} create interaction",
          key: test_key,
          index: sequence[:tests].length + 1,
          link: 'http://build.fhir.org/ig/HL7/fhir-saner/index.html',
          description: "A server #{interaction[:expectation]} support the #{sequence[:resource]} update interaction.",
          optional: interaction[:expectation] != 'SHALL'
        }
        create_test[:test_code] = %(
            resource = FHIR::#{sequence[:resource]}.new
            @resource_created_response = validate_update_reply(resource, FHIR::#{sequence[:resource]})
          )
        sequence[:tests] << create_test
      end
    end
  end
end