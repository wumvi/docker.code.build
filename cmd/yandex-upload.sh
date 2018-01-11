#!/bin/bash

php /yandex-storage/upload.php --src /tmp/code.zip --dst /builds/$HOST/$CI_COMMIT_REF_NAME.zip --token $YANDEX_DISK_TOKEN
exit $?
