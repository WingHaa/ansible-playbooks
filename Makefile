TAG ?= arch-pc

arch:
	docker build . -f arch.Dockerfile -t arch-pc

start:
	docker run --rm -it $(TAG) bash

system:
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i ./inventory/local.ini main.yml

req:
	ansible-galaxy install -r requirements.yml

apps:
	ansible-playbook -i ./inventory/local.ini main.yml -K

check:
	ansible-playbook -i ./inventory/local.ini main.yml -K --check
