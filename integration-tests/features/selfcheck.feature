Feature: Check the implementation of test steps

  @selfcheck
  Scenario: Check that the stack analysis response for the pom.xml that contains only one component
    Given System is running
    When I mock API response by data/mock_stack_analysis_v2_junit.json file
    Then I should find analyzed dependency named junit:junit with version 3.8.1 in the stack analysis
    Then I should find that none analyzed package can be found in companion packages as well
    Then I should receive JSON response with the correct timestamp in attribute started_at
    Then I should receive JSON response with the correct timestamp in attribute finished_at
    Then I should find proper timestamp under the path result/0/_audit/started_at
    Then I should find proper timestamp under the path result/0/_audit/ended_at
    Then I should find the following licenses (Apache 2.0, EPL 1.0, MIT License, ASL 2.0, Free Art, MITNFA, Forbidden Phrase) under the path result/0/recommendation/companion

  @selfcheck
  Scenario: Check that the stack analysis response for the springboot.xml
    Given System is running
    When I download and parse outlier probability threshold value
    Then I should have outlier probability threshold value between 0.0 and 1.0
    When I mock API response by data/mock_stack_analysis_v2_springboot.json file
    Then I should receive JSON response with the correct timestamp in attribute started_at
    Then I should receive JSON response with the correct timestamp in attribute finished_at
    Then I should find proper timestamp under the path result/0/_audit/started_at
    Then I should find proper timestamp under the path result/0/_audit/ended_at
    Then I should find that alternate components replace user components
    Then I should find that none analyzed package can be found in companion packages as well
    Then I should find analyzed dependency named org.springframework:spring-messaging with version 4.3.7.RELEASE in the stack analysis
    Then I should find analyzed dependency named org.springframework.boot:spring-boot-starter-web with version 1.5.2.RELEASE in the stack analysis
    Then I should find analyzed dependency named org.springframework:spring-websocket with version 4.3.7.RELEASE in the stack analysis
    Then I should find analyzed dependency named org.springframework.boot:spring-boot-starter with version 1.5.2.RELEASE in the stack analysis
    Then I should find the proper outlier record for the org.springframework:spring-messaging component
    Then I should find the proper outlier record for the org.springframework.boot:spring-boot-starter component
    Then I should find the proper outlier record for the org.springframework.boot:spring-boot-starter-web component

  @selfcheck
  Scenario: Check that the stack analysis response for the vertx.xml
    Given System is running
    When I download and parse outlier probability threshold value
    Then I should have outlier probability threshold value between 0.0 and 1.0
    When I mock API response by data/mock_stack_analysis_v2_vertx.json file
    Then I should receive JSON response with the correct timestamp in attribute started_at
    Then I should receive JSON response with the correct timestamp in attribute finished_at
    Then I should find proper timestamp under the path result/0/_audit/started_at
    Then I should find proper timestamp under the path result/0/_audit/ended_at
    Then I should find analyzed dependency named io.vertx:vertx-core with version 3.4.1 in the stack analysis
    Then I should find analyzed dependency named io.vertx:vertx-web-templ-freemarker with version 3.4.1 in the stack analysis
    Then I should find analyzed dependency named io.vertx:vertx-jdbc-client with version 3.4.1 in the stack analysis
    Then I should find analyzed dependency named io.vertx:vertx-web with version 3.4.1 in the stack analysis
    Then I should find analyzed dependency named io.vertx:vertx-web-templ-handlebars with version 3.4.1 in the stack analysis
    Then I should find analyzed dependency named io.vertx:vertx-rx-java with version 3.4.1 in the stack analysis
    Then I should find analyzed dependency named io.vertx:vertx-web-client with version 3.4.1 in the stack analysis

  @selfcheck
  Scenario: Check that the stack analysis response for the springboot.xml - CVEs
    Given System is running
    When I mock API response by data/mock_stack_analysis_v2_requirements.json file
    Then I should find the security node for all dependencies
    Then I should find the security node for all alternate components
    Then I should find the CVE-2010-3492 security issue for the dependency six

  @requires_s3_access
  Scenario: Check the package and component tests by using mocked data
    Given System is running
    When I mock S3 data by content of data/clojure_py_package/github_details.json file
    Then I should find the correct GitHub details metadata for package clojure_py from ecosystem pypi
     and I should find empty details about GitHub repository
    When I mock S3 data by content of data/clojure_py_package/keywords_tagging.json file
    Then I should find the correct keywords tagging metadata for package clojure_py from ecosystem pypi
     and I should find the weight for the word clojure in the package name
     and I should find the weight for the word py in the package name
     and I should find the weight for the word clojure in the repository description
     and I should find the weight for the word bytecode in the repository description
     and I should find the weight for the word python in the repository description
    When I mock S3 data by content of data/clojure_py_package/libraries_io.json file
    Then I should find the correct libraries io metadata for package clojure_py from ecosystem pypi
     and I should find that the latest package version 0.2.4 was published on Apr 10, 2012
     and I should find that the recent package version 0.1.0g was published on Mar 8, 2012
     and I should find that the recent package version 0.2.0 was published on Apr 10, 2012
     and I should find that the recent package version 0.2.1 was published on Apr 10, 2012
     and I should find that the recent package version 0.2.2 was published on Apr 10, 2012
     and I should find that the recent package version 0.2.3 was published on Apr 10, 2012
     and I should find 6 releases for this package
     and I should find 0 dependent repositories for this package
     and I should find 0 dependent projects for this package

  @requires_s3_access
  Scenario: Check the component tests by using mocked data
    Given System is running
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4.json file
    Then I should find the correct component core data for package clojure_py version 0.2.4 from ecosystem pypi
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4/dependency_snapshot.json file
    Then I should find the correct dependency snapshot data for package clojure_py version 0.2.4 from ecosystem pypi
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4/digests.json file
    Then I should find the correct digest data for package clojure_py version 0.2.4 from ecosystem pypi
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4/keywords_tagging.json file
    Then I should find the correct keywords tagging data for package clojure_py version 0.2.4 from ecosystem pypi
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4/redhat_downstream.json file
    Then I should find the correct Red Hat downstream data for package clojure_py version 0.2.4 from ecosystem pypi
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4/security_issues.json file
    Then I should find the correct security issues data for package clojure_py version 0.2.4 from ecosystem pypi
    When I mock S3 data by content of data/clojure_py_core_data/0.2.4/source_licenses.json file
    Then I should find the correct source licenses data for package clojure_py version 0.2.4 from ecosystem pypi
