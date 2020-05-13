# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureSourcePushSanerResourceLocationSequence < SequenceBase
      title 'Resource Location Profile Tests'

      description 'Verify support for the server capabilities required by the Resource Location Profile.'

      details %(
      )

      test_id_prefix 'RLPROF'

      requires :location_id
      conformance_supports :Location

      @resource_found = nil

      test :resource_create do
        metadata do
          id '01'
          name 'Server creates Location resource with the Location create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          description %(
            This test will attempt to Reference to Location can be resolved and read.
          )
          versions :r4
        end

        resource = FHIR::Location.new
        @resource_created_response = validate_create_reply(resource, FHIR::Location)
      end

      test :create_interaction do
        metadata do
          id '02'
          name 'Server returns correct Location resource from Location create interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          optional
          description %(
            A server SHOULD support the Location create interaction.
          )
          versions :r4
        end
      end

      test :update_interaction do
        metadata do
          id '03'
          name 'Server returns correct Location resource from Location update interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          optional
          description %(
            A server SHOULD support the Location update interaction.
          )
          versions :r4
        end
      end
    end
  end
end
