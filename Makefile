PROJECTNAME = "svg_to_avd"
ROOT := $(shell git rev-parse --show-toplevel)
FLUTTER := $(shell which flutter)
COVERDE := $(shell which coverde)
REPLACE := $(shell which replace)
IGNORE_OUTPUT := >/dev/null
FILTER_OPTIONS := \.g.dart,\.freezed.dart

.PHONY: help
## help: this help prompt
help: Makefile
	@echo
	@echo "Choose a command to run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: init
## init: run all the necessary one-time setup
init:
	@if ! which coverde $(IGNORE_OUTPUT); then $(FLUTTER) pub global activate coverde; fi
	@if ! which replace $(IGNORE_OUTPUT); then $(FLUTTER) pub global activate replace; fi

.PHONY: test
## test: test the app
test:
	@rm -rf coverage
	$(FLUTTER) test --coverage --test-randomize-ordering-seed random
	@make filter_test

.PHONY: report
## report: open the coverage reports generated by `test`
report:
	@make init
	$(COVERDE) report -l -i coverage/filtered.lcov.info $(IGNORE_OUTPUT)

.PHONY: filter_test
## filter_test: remove unwanted test files from the test report
filter_test:
	@make init
	@$(COVERDE) filter -f $(FILTER_OPTIONS) -m w $(IGNORE_OUTPUT)
	@$(REPLACE) $(shell pwd) '' coverage/filtered.lcov.info $(IGNORE_OUTPUT)

.PHONY: coverage
## coverage: tests and generate coverage report
coverage:
	make test
	make report
