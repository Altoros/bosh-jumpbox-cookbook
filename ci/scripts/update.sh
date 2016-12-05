#!/usr/local/bin/dumb-init /bin/bash

set -e

ARGS=("$@")

bosh-init() {
	VERSION=$(cat bosh-init/version)
	OLDVERSION=$(grep -o -P "\\s*[v=]*\\s*([0-9]+)\\.([0-9]+)\\.([0-9]+)" cookbook/attributes/bosh-init.rb)
	wget --quiet https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-${VERSION}-linux-amd64 --output-document=bosh-init-binary --tries=7
	SHASUM=$(shasum -a 256 ./bosh-init-binary | cut -d " " -f1)
	OLDSHA=$(egrep -o -E -e "[0-9a-f]{64}" cookbook/attributes/bosh-init.rb)
	sed -i "s/${OLDVERSION}/${VERSION}/g; s/${OLDSHA}/${SHASUM}/g" cookbook/attributes/bosh-init.rb
	update
}

cf-cli() {
	VERSION=$(cat cf-cli/version)
	OLDVERSION=$(grep -o -P "v[0-9]+(\.[0-9]+)*" cookbook/attributes/cf-cli.rb | cut -c 2-)
	wget --quiet https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v${VERSION}/cf-cli_${VERSION}_linux_x86-64.tgz --output-document=cf.tgz --tries=7
	SHASUM=$(shasum -a 256 ./cf.tgz | cut -d " " -f1)
	OLDSHA=$(egrep -o -E -e "[0-9a-f]{64}" cookbook/attributes/cf-cli.rb)
	sed -i "s/${OLDVERSION}/${VERSION}/g; s/${OLDSHA}/${SHASUM}/g" cookbook/attributes/cf-cli.rb
	update
}

spiff() {
	SHASUM=$(shasum -a 256 ./spiff/spiff_linux_amd64 | cut -d " " -f1)
	OLDSHA=$(egrep -o -E -e "[0-9a-f]{64}" cookbook/attributes/spiff.rb)
	TAG=$(cat spiff/tag)
	OLDTAG=$(grep -o -P "v[0-9]+(\.[0-9]+)*" cookbook/attributes/spiff.rb)
	sed -i "s/${OLDTAG}/${TAG}/g; s/${OLDSHA}/${SHASUM}/g" cookbook/attributes/spiff.rb
	update
}

spruce() {
	SHASUM=$(shasum -a 256 ./spruce/spruce-linux-amd64 | cut -d " " -f1)
	OLDSHA=$(egrep -o -E -e "[0-9a-f]{64}" cookbook/attributes/spruce.rb)
	TAG=$(cat spruce/tag)
	OLDTAG=$(grep -o -P "v[0-9]+(\.[0-9]+)*" cookbook/attributes/spruce.rb)
	sed -i "s/${OLDTAG}/${TAG}/g; s/${OLDSHA}/${SHASUM}/g" cookbook/attributes/spruce.rb
	update
}

fly() {
	SHASUM=$(shasum -a 256 ./fly/fly_linux_amd64 | cut -d " " -f1)
	OLDSHA=$(egrep -o -E -e "[0-9a-f]{64}" cookbook/attributes/fly.rb)
	TAG=$(cat fly/tag)
	OLDTAG=$(grep -o -P "v[0-9]+(\.[0-9]+)*" cookbook/attributes/fly.rb)
	sed -i "s/${OLDTAG}/${TAG}/g; s/${OLDSHA}/${SHASUM}/g" cookbook/attributes/fly.rb
	update
}

terraform(){
	VERSION=$(cat terraform/version)
	OLDVERSION=$(grep -o -P "\\s*[v=]*\\s*([0-9]+)\\.([0-9]+)\\.([0-9]+)" cookbook/attributes/terraform.rb | head -n 1)
	wget --quiet https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip --output-document=terraform.zip --tries=7
	SHASUM=$(shasum -a 256 ./terraform.zip | cut -d " " -f1)
	OLDSHA=$(egrep -o -E -e "[0-9a-f]{64}" cookbook/attributes/terraform.rb)
	sed -i "s/${OLDVERSION}/${VERSION}/g; s/${OLDSHA}/${SHASUM}/g" cookbook/attributes/terraform.rb
	update
}

update() {
	pushd cookbook > /dev/null
  		git config user.email "${GIT_EMAIL}"
  		git config user.name "${GIT_USERNAME}"
  		git remote add -f cookbook-develop ../cookbook-develop
  		git stash
  		git checkout cookbook-develop/${MERGED_REPO}
  		git stash pop
  		git commit -am "Bump ${ARGS} to ${VERSION}"
	popd > /dev/null
	shopt -s dotglob
	cp -R cookbook/* cookbook-updated
}

# do whatever the arg is
$1
