TAG ?= arch-pc

ubuntu:
	docker build . -t ubuntu-pc

arch:
	docker build . -f arch.Dockerfile -t arch-pc

start:
	docker run --rm -it $(TAG) bash

req:
	ansible-galaxy install -r requirements.yml

ansible:
	ansible-playbook -i ./inventory/local.ini main.yml -K
