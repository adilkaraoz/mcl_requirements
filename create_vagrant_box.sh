BOX_NAME=mcl_requirements

set -e

vagrant up
vagrant package --output $BOX_NAME.box
