#!/bin/bash
TERRAFORM_ZIP_FILE=terraform_0.12.2_linux_amd64.zip
TERRAFORM=  https://releases.hashicorp.com/terraform/0.12.2
TERRAFORM_BIN= terraform

function install_terraform{
 if [ -z $(which $TERRAFORM_BIN) ]; then
	 sudo yum install wget -y
	 sudo yum install unzip -y
	 wget ${TERRAFORM}/${TERRAFORM_ZIP_FILE}
	 unzip ${TERRAFORM_BIN} /usr/local/bin/${TERRAFORM_BIN}
	 rm -rf ${TERRAFORM_ZIP_FILE}
	 terraform version
	 echo "========================================="
	 echo " "
	 echo "currently installed version ins -" $(terraform version) 
	 echo " "
	 echo "=========================================="
 else
	 echo "=========================================="
	 echo " "
	 echo "Terraform is most likely installed with this version - $(terraform -v) "
	 echo "=========================================="
 fi
}
install_terraform

