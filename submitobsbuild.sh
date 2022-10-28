#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

MYDATE=`date`

# checkout the OSB package
osc co home:useidel fetchmail7

cd home*

# copy (updated) files to working directory
# note that the content from github is now in the upper directory
# and the tar archives is in the RPM build area
cp ../*spec fetchmail7/
osc delete fetchmail7/*.tar.gz
cp /github/home/rpmbuild/SOURCES/*.tar.gz fetchmail7/
osc add fetchmail7/*.tar.gz

# mark files for update if there are new ones
#cd dummy
#osc add *spec
#cd ..

# upload changed content
osc ci -m "Update from $MYDATE" fetchmail7

