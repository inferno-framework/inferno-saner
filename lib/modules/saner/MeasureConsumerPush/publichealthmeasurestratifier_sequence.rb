# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureConsumerPushPublicHealthMeasureStratifierSequence < SequenceBase
      title 'Saner Public Health Measure Stratifier Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure Stratifier.'

      details %(
      )

      test_id_prefix 'SPHMST'

      requires :measure_id
      conformance_supports :Measure

      @resource_found = nil

      test :resource_read do
        metadata do
          id '01'
          name 'Server returns correct Measure resource from the Measure read interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          description %(
            This test will attempt to Reference to Measure can be resolved and read.
          )
          versions :r4
        end

        resource_id = @instance.measure_id
        @resource_found = validate_read_reply(FHIR::Measure.new(id: resource_id), FHIR::Measure)
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

      test 'Measure resources returned from previous search conform to the Saner Public Health Measure Stratifier.' do
        metadata do
          id '04'
          link ''
          description %(

          )
          versions :r4
        end

        test_resources_against_profile('Measure')
      end
    end
  end
end
