# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureSourcePushPublicHealthMeasureStratifierSequence < SequenceBase
      title 'Saner Public Health Measure Stratifier Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure Stratifier.'

      details %(
      )

      test_id_prefix 'SPHMSTRA'

      requires :measure_id
      conformance_supports :Measure

      @resource_found = nil

      test :resource_create do
        metadata do
          id '01'
          name 'Server creates Measure resource with the Measure create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          description %(
            This test will attempt to Reference to Measure can be resolved and read.
          )
          versions :r4
        end

        resource = FHIR::Measure.new
        @resource_created_response = validate_create_reply(resource, FHIR::Measure)
      end

      test :create_interaction do
        metadata do
          id '02'
          name 'Server returns correct Measure resource from Measure create interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          optional
          description %(
            A server SHOULD support the Measure create interaction.
          )
          versions :r4
        end
      end

      test :update_interaction do
        metadata do
          id '03'
          name 'Server returns correct Measure resource from Measure update interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          optional
          description %(
            A server SHOULD support the Measure update interaction.
          )
          versions :r4
        end
      end
    end
  end
end
