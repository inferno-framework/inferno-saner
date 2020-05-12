# frozen_string_literal: true
module Inferno
  module Generator
    module ReadTest
      def create_read_test(sequence)
        test_key = :resource_read
        read_test = {
          tests_that: "Server returns correct #{sequence[:resource]} resource from the #{sequence[:resource]} read interaction",
          key: test_key,
          index: sequence[:tests].length + 1,
          link: 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html',
          description: "This test will attempt to Reference to #{sequence[:resource]} can be resolved and read."
        }
        read_test[:test_code] = %(
            resource_id = @instance.#{sequence[:resource].downcase}_id
            @resource_found = validate_read_reply(FHIR::#{sequence[:resource]}.new(id: resource_id), FHIR::#{sequence[:resource]})
          )
        sequence[:tests] << read_test
      end
    end
  end
end