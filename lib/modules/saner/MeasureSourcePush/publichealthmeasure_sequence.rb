# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureSourcePushPublicHealthMeasureSequence < SequenceBase
      title 'Saner Public Health Measure Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure.'

      details %(
      )

      test_id_prefix 'SPHMEAS'

      requires
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

        measure_example = File.read(File.expand_path('./resources/saner/saner-measure-example.json'))
        resource = FHIR.from_contents(measure_example)
        @resource_created_response = validate_create_reply(resource, FHIR::Measure)
      end

      test :resource_update do
        metadata do
          id '02'
          name 'Server updates Measure resource with the Measure update interaction'
          link 'http://build.fhir.org/ig/HL7/fhir-saner/index.html'
          optional
          description %(
            A server SHOULD support the Measure update interaction.
          )
          versions :r4
        end

        measure_example = File.read(File.expand_path('./resources/saner/saner-measure-example.json'))
        resource = FHIR.from_contents(measure_example)
        @resource_updated_response = validate_update_reply(resource, FHIR::Measure)
      end
    end
  end
end
