TERMUX_PKG_HOMEPAGE=https://github.com/eza-community/eza
TERMUX_PKG_DESCRIPTION="A modern, maintained replacement for ls"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@SunPodder"
TERMUX_PKG_VERSION="0.11.0"
TERMUX_PKG_SRCURL="https://github.com/eza-community/eza/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=fdaaf450cfaaa41d6ea8ae12fbb8e41e955e255b1169022a7675ca29d7d621c0
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BUILD_DEPENDS="zlib"

termux_step_make() {
	termux_setup_rust
	export CXXFLAGS+=" -lz"
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/eza
}

