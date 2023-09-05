TERMUX_PKG_HOMEPAGE=https://github.com/flxzt/rnote
TERMUX_PKG_DESCRIPTION="Sketch and take handwritten notes"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@SunPodder"
TERMUX_PKG_VERSION="0.8.2"
TERMUX_PKG_SRCURL="https://github.com/flxzt/rnote/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=6d1667929fc4993f7c9d7bce4fcf605e2d7621f262b4c85db478f2f5128f7309
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BUILD_DEPENDS=""

termux_step_make() {
	termux_setup_meson
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/rnote
}

