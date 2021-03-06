setup:
	# Create python virtualenv & source it
	bash -c "python3 -m venv ~/.website77"
	# bash -c "source ~/.website8/bin/activate"

install:
	# This should be run from inside a virtualenv
	bash -c "pip3 install --upgrade pip &&\
		 pip3 install -r requirements.txt"

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

run:
	export FLASK_APP=app.py
	flask run --host=0.0.0.0

all: install lint test
