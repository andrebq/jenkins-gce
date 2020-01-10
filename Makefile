.PHONY = build run publish

build:
	docker build -t andrebq/jenkins-gce:latest .

release:
	bash -x ci/scripts/dockerRelease.sh
