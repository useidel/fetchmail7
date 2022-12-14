#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

# This will setup the needed directory structure to build RPM packages
# please note that this will not happen in the $GITHUB_WORKSPACE 
# but in the RPMBUILD space instead
rpmdev-setuptree

# Get the version from the SPEC file
MYNAME=`grep ^Name: *spec|awk '{print $2}'`
MYCOMMIT=`grep "^%global commit" *.spec|awk '{print $3}'`
MYSHORTCOMMIT=`echo $MYCOMMIT| cut -c1-7`

# copy the also needed patch file(s) to the RPMBUILD space
# again this is different from the $GITHUB_WORKSPACE
###cp *.patch /github/home/rpmbuild/SOURCES
#
## copy the also needed patch file(s) to the RPMBUILD space
# again this is different from the $GITHUB_WORKSPACE
cp * /github/home/rpmbuild/SOURCES
rm /github/home/rpmbuild/SOURCES/*spec


# Now download the sources to the correspoding RPMBUILD directory
cd /github/home/rpmbuild/SOURCES
wget -nd https://gitlab.com/$MYNAME/$MYNAME/-/archive/$MYCOMMIT/$MYNAME-$MYSHORTCOMMIT.tar.gz


