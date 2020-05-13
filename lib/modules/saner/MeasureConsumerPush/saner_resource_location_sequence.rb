# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureConsumerPushSanerResourceLocationSequence < SequenceBase
      title 'Resource Location Profile Tests'

      description 'Verify support for the server capabilities required by the Resource Location Profile.'

      details %(
      )

      test_id_prefix 'RLPR'

      requires :location_id
      conformance_supports :Location

      @resource_found = nil

      test :resource_create do
        metadata do
          id '01'
          name 'Server creates Location resource with the Location create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          optional
          description %(
            A server SHOULD support the Location create interaction.
          )
          versions :r4
        end

        resource = FHIR::Location.new
        @resource_created_response = validate_create_reply(resource, FHIR::Location)
      end

      test :resource_update do
        metadata do
          id '02'
          name 'Server creates Location resource with the Location create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          optional
          description %(
            A server SHOULD support the Location update interaction.
          )
          versions :r4
        end

        resource = FHIR::Location.new
        @resource_created_response = validate_update_reply(resource, FHIR::Location)
      end
    end
  end
end
