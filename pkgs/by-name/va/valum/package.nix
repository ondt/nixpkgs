{
  lib,
  stdenv,
  meson,
  ninja,
  pkg-config,
  fetchFromGitHub,
  glib,
  vala,
  ctpl,
  libgee,
  libsoup_2_4,
  fcgi,
}:

stdenv.mkDerivation rec {
  pname = "valum";
  version = "0.3.18";

  src = fetchFromGitHub {
    owner = "valum-framework";
    repo = "valum";
    rev = "v${version}";
    sha256 = "sha256-baAv83YiX8HdBm/t++ktB7pmTVlt4aWZ5xnsAs/NrTI=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];
  buildInputs = [
    glib
    vala
    ctpl
    libgee
    libsoup_2_4
    fcgi
  ];

  meta = with lib; {
    homepage = "https://github.com/valum-framework/valum";
    description = "Web micro-framework written in Vala";
    license = licenses.lgpl3;
    platforms = platforms.linux;
    maintainers = [ ];
    # Likely broken by GLib 2.74 switch to PCRE 2.
    # https://github.com/valum-framework/valum/issues/238
    broken = true;
  };
}
