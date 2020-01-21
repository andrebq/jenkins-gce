.PHONY = check build build-master build-agent push tag

check:
	docker run --rm -t -w /src -v ${PWD}:/src koalaman/shellcheck ./ci/scripts/*.sh
	docker run --rm -t -w /src -v ${PWD}:/src koalaman/shellcheck ./jenkins-master-lite/*.sh

build: check build-master build-agent

build-master:
	bash -x ci/scripts/dockerBuild.sh "master"

build-agent:
	bash -x ci/scripts/dockerBuild.sh "agent"

release: tag push

tag: build
	bash -x ci/scripts/dockerTag.sh

push:
	bash -x ci/scripts/dockerPush.sh
