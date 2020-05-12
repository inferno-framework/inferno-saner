# frozen_string_literal: true

module Inferno
  module Sequence
    class MeasureConsumerPullPublicHealthMeasureReportSequence < SequenceBase
      title 'Saner Public Health Measure Report Tests'

      description 'Verify support for the server capabilities required by the Saner Public Health Measure Report.'

      details %(
      )

      test_id_prefix 'SPHMR'

      requires :measurereport_id
      conformance_supports :MeasureReport

      def validate_resource_item(resource, property, value)
        case property

        when '_id'
          values_found = resolve_path(resource, 'id')
          values = value.split(/(?<!\\),/).each { |str| str.gsub!('\,', ',') }
          match_found = values_found.any? { |value_in_resource| values.include? value_in_resource }
          assert match_found, "_id in MeasureReport/#{resource.id} (#{values_found}) does not match _id requested (#{value})"

        when 'code'
          values_found = resolve_path(resource, 'code')
          values = value.split(/(?<!\\),/).each { |str| str.gsub!('\,', ',') }
          match_found = values_found.any? { |value_in_resource| values.include? value_in_resource }
          assert match_found, "code in MeasureReport/#{resource.id} (#{values_found}) does not match code requested (#{value})"

        when 'date'
          values_found = resolve_path(resource, 'date')
          values = value.split(/(?<!\\),/).each { |str| str.gsub!('\,', ',') }
          match_found = values_found.any? { |value_in_resource| values.include? value_in_resource }
          assert match_found, "date in MeasureReport/#{resource.id} (#{values_found}) does not match date requested (#{value})"

        when 'measure'
          values_found = resolve_path(resource, 'measure')
          values = value.split(/(?<!\\),/).each { |str| str.gsub!('\,', ',') }
          match_found = values_found.any? { |value_in_resource| values.include? value_in_resource }
          assert match_found, "measure in MeasureReport/#{resource.id} (#{values_found}) does not match measure requested (#{value})"

        when 'subject'
          values_found = resolve_path(resource, 'subject.reference')
          match_found = values_found.any? { |reference| [value, 'Patient/' + value].include? reference }
          assert match_found, "subject in MeasureReport/#{resource.id} (#{values_found}) does not match subject requested (#{value})"

        when 'period'
          values_found = resolve_path(resource, 'period')
          match_found = values_found.any? { |date| validate_date_search(value, date) }
          assert match_found, "period in MeasureReport/#{resource.id} (#{values_found}) does not match period requested (#{value})"

        when 'reporter'
          values_found = resolve_path(resource, 'reporter.reference')
          values = value.split(/(?<!\\),/).each { |str| str.gsub!('\,', ',') }
          match_found = values_found.any? { |value_in_resource| values.include? value_in_resource }
          assert match_found, "reporter in MeasureReport/#{resource.id} (#{values_found}) does not match reporter requested (#{value})"

        end
      end

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

      test 'Server returns valid results for MeasureReport search by _id.' do
        metadata do
          id '02'
          link ''
          description %(

            A server SHALL support searching by _id on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          '_id': get_value_for_search_param(resolve_element_from_path(@resource_found, 'id') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end

      test 'Server returns valid results for MeasureReport search by date.' do
        metadata do
          id '03'
          link ''
          description %(

            A server SHALL support searching by date on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          'date': get_value_for_search_param(resolve_element_from_path(@resource_found, 'date') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end

      test 'Server returns valid results for MeasureReport search by measure.' do
        metadata do
          id '04'
          link ''
          description %(

            A server SHALL support searching by measure on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          'measure': get_value_for_search_param(resolve_element_from_path(@resource_found, 'measure') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end

      test 'Server returns valid results for MeasureReport search by subject.' do
        metadata do
          id '05'
          link ''
          description %(

            A server SHALL support searching by subject on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          'subject': get_value_for_search_param(resolve_element_from_path(@resource_found, 'subject') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end

      test 'Server returns valid results for MeasureReport search by period.' do
        metadata do
          id '06'
          link ''
          description %(

            A server SHALL support searching by period on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          'period': get_value_for_search_param(resolve_element_from_path(@resource_found, 'period') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end

      test 'Server returns valid results for MeasureReport search by reporter.' do
        metadata do
          id '07'
          link ''
          description %(

            A server SHALL support searching by reporter on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          'reporter': get_value_for_search_param(resolve_element_from_path(@resource_found, 'reporter') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end

      test 'Server returns valid results for MeasureReport search by code.' do
        metadata do
          id '08'
          link ''
          optional
          description %(

            A server SHOULD support searching by code on the MeasureReport resource.
            This test will pass if resources are returned and match the search criteria.

          )
          versions :r4
        end

        search_params = {
          'code': get_value_for_search_param(resolve_element_from_path(@resource_found, 'code') { |el| get_value_for_search_param(el).present? })
        }
        skip if search_params.any? { |_param, value| value.nil? }

        reply = get_resource_by_params(versioned_resource_class('MeasureReport'), search_params)
        validate_search_reply(versioned_resource_class('MeasureReport'), reply, search_params)
      end
    end
  end
end
