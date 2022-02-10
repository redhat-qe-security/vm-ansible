make:
	ansible-playbook rhel-8-sc.yaml

rhel8:
	ansible-playbook rhel-8-sc.yaml

rhel9:
	echo "script for RHEL 9"

manual-rhel8:
	echo "script for manual testing for latest RHEL 8"

manual-rhel9:
	echo "script for manual testing for latest RHEL 9"
