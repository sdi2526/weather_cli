Set-PSDebug -Trace 1
dart run test --coverage=coverage_results
dart run coverage:format_coverage --lcov --in=coverage_results --out=coverage_results/lcov.info --report-on=lib
Set-PSDebug -Off

