# frozen_string_literal: true

module Inferno
  module Generator
    module ReadTest
      def create_create_test(sequence)
        test_key = :resource_create
        create_test = {
          tests_that: "Server creates #{sequence[:resource]} resource with the #{sequence[:resource]} create interaction",
          key: test_key,
          index: sequence[:tests].length + 1,
          link: 'http://build.fhir.org/ig/HL7/fhir-saner/index.html',
          description: "This test will attempt to Reference to #{sequence[:resource]} can be resolved and read."
        }
        create_test[:test_code] = %(
            resource = FHIR::#{sequence[:resource]}.new
            @resource_created_response = validate_create_reply(resource, FHIR::#{sequence[:resource]})
          )
        sequence[:tests] << create_test
      end
    end
  end
end
