# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureConsumerPushsaner_resource_locationSequence < SequenceBase
      title 'Resource Location Profile Tests'

      description 'Verify support for the server capabilities required by the Resource Location Profile.'

      details %(
      )

      test_id_prefix 'RLPR'

      requires :location_id
      conformance_supports :Location

      @resource_found = nil

      test :resource_read do
        metadata do
          id '01'
          name 'Server returns correct Location resource from the Location read interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          description %(
            This test will attempt to Reference to Location can be resolved and read.
          )
          versions :r4
        end

        resource_id = @instance.location_id
        @resource_found = validate_read_reply(FHIR::Location.new(id: resource_id), FHIR::Location)
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

      test 'Location resources returned from previous search conform to the Resource Location Profile.' do
        metadata do
          id '04'
          link ''
          description %(

          )
          versions :r4
        end

        test_resources_against_profile('Location')
      end
    end
  end
end
