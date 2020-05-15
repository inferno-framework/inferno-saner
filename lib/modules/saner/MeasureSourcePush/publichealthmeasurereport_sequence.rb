# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureSourcePushPublicHealthMeasureReportSequence < SequenceBase
      title 'Saner Public Health Measure Report Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure Report.'

      details %(
      )

      test_id_prefix 'SPHMREPO'

      requires
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

        measurereport_example = File.read(File.expand_path('./resources/saner/saner-measurereport-example.json'))
        resource = FHIR.from_contents(measurereport_example)
        @resource_created_response = validate_create_reply(resource, FHIR::MeasureReport)
      end

      test :resource_update do
        metadata do
          id '02'
          name 'Server updates MeasureReport resource with the MeasureReport update interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          description %(
            A server SHALL support the MeasureReport update interaction.
          )
          versions :r4
        end

        measurereport_example = File.read(File.expand_path('./resources/saner/saner-measurereport-example.json'))
        resource = FHIR.from_contents(measurereport_example)
        @resource_updated_response = validate_update_reply(resource, FHIR::MeasureReport)
      end
    end
  end
end
