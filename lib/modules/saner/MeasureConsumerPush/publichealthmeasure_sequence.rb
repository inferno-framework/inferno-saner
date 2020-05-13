# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureConsumerPushPublicHealthMeasureSequence < SequenceBase
      title 'Saner Public Health Measure Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure.'

      details %(
      )

      test_id_prefix 'SPHME'

      requires :measure_id
      conformance_supports :Measure

      @resource_found = nil

      test :resource_create do
        metadata do
          id '01'
          name 'Server creates Measure resource with the Measure create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          optional
          description %(
            A server SHOULD support the Measure create interaction.
          )
          versions :r4
        end

        resource = FHIR::Measure.new
        @resource_created_response = validate_create_reply(resource, FHIR::Measure)
      end
    end
  end
end
