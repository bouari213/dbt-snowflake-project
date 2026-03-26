{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is none -%}
        {{ default_schema }}

    {%- elif target.name == 'dev1' -%}
        DEV1_{{ custom_schema_name | upper }}

    {%- elif target.name == 'dev2' -%}
        DEV2_{{ custom_schema_name | upper }}

    {%- elif target.name == 'uat' -%}
        UAT_{{ custom_schema_name | upper }}

    {%- elif target.name == 'prod' -%}
        PROD_{{ custom_schema_name | upper }}

    {%- else -%}
        {{ default_schema }}_{{ custom_schema_name | upper }}

    {%- endif -%}

{%- endmacro %}