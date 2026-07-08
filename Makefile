SHELL := /bin/bash

.PHONY: help setup lint test package ci-check validate-memory

PYTHON ?= python3

help:
	@echo "Targets: setup lint test package validate-memory ci-check"

setup:
	$(PYTHON) -m pip install -r requirements-dev.txt

lint:
	$(PYTHON) -m compileall -q select-photos/scripts tests
	@bash scripts/ci/check_repo.sh --structure-only

test:
	$(PYTHON) -m pytest -q

package:
	@bash scripts/package_skill.sh

validate-memory:
	@bash scripts/ci/check_repo.sh --memory-only

ci-check: lint test package
	@bash scripts/ci/check_repo.sh
