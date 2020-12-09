ifneq ("$(wildcard ./.env)","")
	include ./.env
	export
endif

ifeq ("$(PYTHON_EXECUTABLE)","")
	PYTHON_EXECUTABLE = python
endif

PIP = $(PYTHON_EXECUTABLE) -m pip

tests:
	poetry run tox
.PHONY: tests

docs:
	poetry run sphinx-build --version || poetry install --no-root -v -E docs
	cd docs && $(MAKE) html
