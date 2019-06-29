UBUNTU=18.04

usage:
	@echo "Run make update, make build, and make push"

update:
	docker pull ubuntu:${UBUNTU}

build:
	cd ubuntu-base && docker build -t wpilib/ubuntu-base:${UBUNTU} .
	cd roborio-cross-ubuntu && \
	    docker build -t wpilib/roborio-cross-ubuntu:2020-${UBUNTU} -f Dockerfile.2020 .
	cd raspbian-cross-ubuntu && \
	    docker build -t wpilib/raspbian-cross-ubuntu:9-${UBUNTU} -f Dockerfile.9 . && \
	    docker build -t wpilib/raspbian-cross-ubuntu:10-${UBUNTU} -f Dockerfile.10 .
	cd aarch64-cross-ubuntu && \
	    docker build -t wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU} -f Dockerfile.bionic .

push:
	docker push wpilib/ubuntu-base:${UBUNTU}
	docker push wpilib/roborio-cross-ubuntu:2020-${UBUNTU}
	docker push wpilib/raspbian-cross-ubuntu:9-${UBUNTU}
	docker push wpilib/raspbian-cross-ubuntu:10-${UBUNTU}
	docker push wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU}
