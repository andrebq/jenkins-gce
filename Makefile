.PHONY = check build build-master build-agent push tag fmt

check:
	docker run --rm -t -w /src -v ${PWD}:/src koalaman/shellcheck ./ci/scripts/*.sh
	docker run --rm -t -w /src -v ${PWD}:/src koalaman/shellcheck ./jenkins-master-lite/*.sh

fmt:
	bash -x ci/scripts/fmt.sh "master"

build: check fmt build-master build-agent

build-master:
	bash -x ci/scripts/dockerBuild.sh "master"

build-agent:
	bash -x ci/scripts/dockerBuild.sh "agent"

release: tag push

tag: build
	bash -x ci/scripts/dockerTag.sh

run-lite: tag
	docker run --rm -ti andrebq/jenkins-gce-master-lite:0.0.3

push:
	bash -x ci/scripts/dockerPush.sh
