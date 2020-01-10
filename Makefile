.PHONY = build run publish

build:
	docker build -t andrebq/jenkins-gce:latest .

publish:
	docker push andrebq/jenkins-gce:latest
