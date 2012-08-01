#!/system/bin/sh

RRIL_REPO_DST=/data/rril/repository.txt

rril_repo_missing=`ls $RRIL_REPO_DST`true

if (${rril_repo_missing}) ; then
	mkdir /data/rril
	cat /etc/rril/repository.txt > $RRIL_REPO_DST
	sync
	/system/bin/log -t RIL-repo "created $RRIL_REPO_DST"
else
	/system/bin/log -t RIL-repo "$RRIL_REPO_DST exists"
fi

# set this property after checking that repository exists or after it's created
# This is checked in rildmain mainloop during RIL_Init
/system/bin/setprop "net.rril.repository" "ready"
