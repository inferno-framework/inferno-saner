# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureConsumerPushPublicHealthMeasureReportSequence < SequenceBase
      title 'Saner Public Health Measure Report Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure Report.'

      details %(
      )

      test_id_prefix 'SPHMRE'

      requires :measurereport_id
      conformance_supports :MeasureReport

      @resource_found = nil

      test :resource_create do
        metadata do
          id '01'
          name 'Server creates MeasureReport resource with the MeasureReport create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          description %(
            This test will attempt to Reference to MeasureReport can be resolved and read.
          )
          versions :r4
        end

        resource = FHIR::MeasureReport.new
        @resource_created_response = validate_create_reply(resource, FHIR::MeasureReport)
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
    end
  end
end
