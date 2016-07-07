DOCKER=docker
IMAGE=lappsgrid/galaxy-discovery
TARFILE=galaxy-lappsgrid-cmu.tar
TAG=discovery

discovery:
	$(DOCKER) build -f Dockerfile.cmu -t $(IMAGE) .

cmu:
	$(DOCKER) build -f Dockerfile.cmu -t $(IMAGE):cmu .

no-cache:
	$(DOCKER) build --no-cache -f Dockerfile.cmu -t $(IMAGE):cmu .

latest:
	$(DOCKER) build -f Dockerfile -t $(IMAGE) .
	
push:
	$(DOCKER) push $(IMAGE)

tag:
	if [ -n "$(TAG)" ] ; then $(DOCKER) tag $(IMAGE):cmu $(IMAGE):$(TAG) ; fi

help:
	@echo "GOALS"
	@echo
	@echo "cmu"
	@echo "    Builds with services configured to call"
	@echo "    Dockerized services (default goal)."
	@echo "latest"
	@echo "    Builds Dockerfile"
	@echo "push"
	@echo "    Pushes $(IMAGE):cmu to the Docker Hub."
	@echo "tag"
	@echo "    Tags $(IMAGE):cmu on the Docker Hub."
	@echo "help"
	@echo "    Prints these usage instructions."
	@echo
	

