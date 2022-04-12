IPA_IP="192.168.122.34"
SERVER_NAME="ipa-server-new"
DOMAIN="sc.test.com"
OPTIONS="server_ip=${IPA_IP} server_name=${SERVER_NAME} domain=${DOMAIN} client_name=${CLIENT_NAME} ipa_username=${IPA_USERNAME}"

rhel8-virt-card:
	ansible-playbook rhel-sc.yaml -e "rhel_version=8.6 img_name=${NAME} ${OPTIONS}"

rhel9-virt-card:
	ansible-playbook rhel-sc.yaml -e "rhel_version=9.0 img_name=${NAME} ${OPTIONS}"

rhel8-real-card:
	ansible-playbook real-cards.yaml -e "rhel_version=8.6 img_name=${NAME}"

rhel9-real-card:
	ansible-playbook real-cards.yaml -e "rhel_version=9.0 img_name=${NAME}"
