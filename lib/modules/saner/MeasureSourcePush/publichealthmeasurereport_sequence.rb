# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureSourcePushPublicHealthMeasureReportSequence < SequenceBase
      title 'Saner Public Health Measure Report Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure Report.'

      details %(
      )

      test_id_prefix 'SPHMREPO'

      requires :measurereport_id
      conformance_supports :MeasureReport

      @resource_found = nil

      test :resource_read do
        metadata do
          id '01'
          name 'Server returns correct MeasureReport resource from the MeasureReport read interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          description %(
            This test will attempt to Reference to MeasureReport can be resolved and read.
          )
          versions :r4
        end

        resource_id = @instance.measurereport_id
        @resource_found = validate_read_reply(FHIR::MeasureReport.new(id: resource_id), FHIR::MeasureReport)
      end

      test :create_interaction do
        metadata do
          id '02'
          name 'Server returns correct MeasureReport resource from MeasureReport create interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          description %(
            A server SHALL support the MeasureReport create interaction.
          )
          versions :r4
        end
      end

      test :update_interaction do
        metadata do
          id '03'
          name 'Server returns correct MeasureReport resource from MeasureReport update interaction'
          link 'https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html'
          description %(
            A server SHALL support the MeasureReport update interaction.
          )
          versions :r4
        end
      end

      test 'MeasureReport resources returned from previous search conform to the Saner Public Health Measure Report.' do
        metadata do
          id '04'
          link ''
          description %(

          )
          versions :r4
        end

        test_resources_against_profile('MeasureReport')
      end
    end
  end
end
