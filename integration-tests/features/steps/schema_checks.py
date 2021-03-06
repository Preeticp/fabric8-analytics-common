"""Data structures validation against schemas."""

from behave import given, then, when

# package-related schemas
from src.schemas.package_toplevel import PACKAGE_TOPLEVEL_SCHEMA
from src.schemas.package_git_stats import PACKAGE_GIT_STATS_SCHEMA
from src.schemas.package_github_details import PACKAGE_GITHUB_DETAILS_SCHEMA
from src.schemas.package_keywords_tagging import PACKAGE_KEYWORDS_TAGGING_SCHEMA
from src.schemas.package_libraries_io import PACKAGE_LIBRARIES_IO_SCHEMA

# component-related schemas
from src.schemas.component_toplevel import COMPONENT_TOPLEVEL_SCHEMA
from src.schemas.component_code_metrics import COMPONENT_CODE_METRICS_SCHEMA
from src.schemas.component_security_issues import COMPONENT_SECURITY_ISSUES_SCHEMA
from src.schemas.component_digests import COMPONENT_DIGESTS_SCHEMA
from src.schemas.component_source_licenses import COMPONENT_SOURCE_LICENSES_2_0_0_SCHEMA
from src.schemas.component_source_licenses import COMPONENT_SOURCE_LICENSES_3_0_0_SCHEMA
from src.schemas.component_dependency_snapshot import COMPONENT_DEPENDENCY_SNAPSHOT_SCHEMA
from src.schemas.component_metadata import COMPONENT_METADATA_SCHEMA
from src.schemas.component_keywords_tagging import COMPONENT_KEYWORDS_TAGGING_SCHEMA


@then(u'I should find that the metadata conformns to component_toplevel schema')
def check_component_metadata_schema(context):
    """Check if the component toplevel metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_TOPLEVEL_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_code_metrics schema')
def check_component_code_metrics_schema(context):
    """Check if the component code metrics metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_CODE_METRICS_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_security_issues schema')
def check_component_security_issues_schema(context):
    """Check if the component security issues metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_SECURITY_ISSUES_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_digests schema')
def check_component_digests_schema(context):
    """Check if the component digests metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_DIGESTS_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_dependency_snapshot schema')
def check_component_dependency_snapshot_schema(context):
    """Check if the component dependency snapshot metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_DEPENDENCY_SNAPSHOT_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_metadata schema')
def check_component_metadata_schema(context):
    """Check if the component metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_METADATA_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_keywords_tagging schema')
def check_component_keywords_tagging_schema(context):
    """Check if the component keywords tagging metadata conformns to schema."""
    json_data = context.s3_data
    assert COMPONENT_KEYWORDS_TAGGING_SCHEMA == json_data


@then(u'I should find that the metadata conformns to component_source_licenses schema')
@then(u'I should find that the metadata conformns to component_source_licenses schema ' +
      'version {version:d}')
def check_component_source_licenses_schema(context, version=None):
    """Check if the component source licenses metadata conformns to schema."""
    json_data = context.s3_data

    if not version:
        versions = {"2-0-0": 2,
                    "3-0-0": 3}
        schema_version = json_data["schema"]["version"]
        version = versions[schema_version]

    if version == 2:
        assert COMPONENT_SOURCE_LICENSES_2_0_0_SCHEMA == json_data
    else:
        assert COMPONENT_SOURCE_LICENSES_3_0_0_SCHEMA == json_data


@then(u'I should find that the metadata conformns to package_toplevel schema')
def check_package_metadata_schema(context):
    """Check if the package toplevel metadata conformns to schema."""
    json_data = context.s3_data
    assert PACKAGE_TOPLEVEL_SCHEMA == json_data


@then(u'I should find that the metadata conformns to package_git_stats schema')
def check_package_git_stats_schema(context):
    """Check if the package git stats metadata conformns to schema."""
    json_data = context.s3_data
    assert PACKAGE_GIT_STATS_SCHEMA == json_data


@then(u'I should find that the metadata conformns to package_github_details schema')
def check_package_github_details_schema(context):
    """Check if the package github details metadata conformns to schema."""
    json_data = context.s3_data
    assert PACKAGE_GITHUB_DETAILS_SCHEMA == json_data


@then(u'I should find that the metadata conformns to package_keywords_tagging schema')
def check_package_keywords_tagging_schema(context):
    """Check if the package keywords tagging metadata conformns to schema."""
    json_data = context.s3_data
    assert PACKAGE_KEYWORDS_TAGGING_SCHEMA == json_data


@then(u'I should find that the metadata conformns to package_libraries_is schema')
def check_package_libraries_io_schema(context):
    """Check if the package libraries io metadata conformns to schema."""
    json_data = context.s3_data
    assert PACKAGE_LIBRARIES_IO_SCHEMA == json_data
