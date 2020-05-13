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

      test :resource_create do
        metadata do
          id '01'
          name 'Server creates MeasureReport resource with the MeasureReport create interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          description %(
            A server SHALL support the MeasureReport create interaction.
          )
          versions :r4
        end

        resource = FHIR::MeasureReport.new
        @resource_created_response = validate_create_reply(resource, FHIR::MeasureReport)
      end
    end
  end
end
