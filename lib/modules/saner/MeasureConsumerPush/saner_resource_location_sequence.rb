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

      test :create_interaction do
        metadata do
          id '01'
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
          id '02'
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
