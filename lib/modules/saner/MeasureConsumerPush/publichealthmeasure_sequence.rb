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

      test :create_interaction do
        metadata do
          id '01'
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
          id '02'
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