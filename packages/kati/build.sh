TERMUX_PKG_HOMEPAGE=https://github.com/google/kati
TERMUX_PKG_DESCRIPTION="An experimental GNU make clone"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
_COMMIT=532b343f4be96abf0dec4c6f2a4785d671a985df
_COMMIT_DATE=2023.06.21
TERMUX_PKG_VERSION=${_COMMIT_DATE//./}
TERMUX_PKG_SRCURL=git+https://github.com/google/kati.git
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_get_source() {
        git fetch --unshallow
        git checkout $_COMMIT

        local version="$(git log -1 --format=%cs | sed 's/-/./g')"
        if [ "$version" != "$_COMMIT_DATE" ]; then
                echo -n "ERROR: The specified commit date \"$_COMMIT_DATE\""
                echo " is different from what is expected to be: \"$version\""
                return 1
        fi
}

termux_step_make_install() {
	install -Dm700 kati $TERMUX_PREFIX/bin/kati
}

