{ 
  pkgs,
  stdenv, 
  lib, 
  fetchurl, 
  zlib, 
  glib, 
  xorg, 
  dbus, 
  fontconfig, 
  freetype, 
  libGL, 
  juliaVersion ? "1.9.2", 
  juliaSha256 ? "10s3gksi64vvxr7g4mffp50s0bmpmhmxl6bvh8cffzrd8jgpjbac",
  juliaName ? "julia",
  sysimage ? "",
  ... }:

let

cPackages = pkgs: ([pkgs.clang pkgs.gcc pkgs.cmake pkgs.gnumake]);

systemPackages = pkgs: ([]);

mkJulia = pkgs: version: sha256: (stdenv.mkDerivation {
  name = "julia";
  src = fetchurl {
      inherit sha256;
      url = "https://julialang-s3.julialang.org/bin/linux/x64/${
        lib.versions.majorMinor version
      }/julia-${version}-linux-x86_64.tar.gz";
  };
  installPhase = ''
    mkdir $out
    cp -R * $out/
  '';
  dontStrip = true;
  ldLibraryPath = lib.makeLibraryPath [
    stdenv.cc.cc
    zlib
    glib
    xorg.libXi
    xorg.libxcb
    xorg.libXrender
    xorg.libX11
    xorg.libSM
    xorg.libICE
    xorg.libXext
    dbus
    fontconfig
    freetype
    libGL
    ];
  
});

julia = (mkJulia pkgs juliaVersion juliaSha256);


sysimages = stdenv.mkDerivation {
  name = "sysimages";
  src = ./environments; 
  installPhase = ''
    mkdir $out
    cp -R * $out/
  '';
};

allPackages = pkgs: [ julia ] ++ (cPackages pkgs) ++ (systemPackages pkgs);

juliaCommand = if sysimage == "" then "julia" else "julia -J${sysimages}/${sysimage}/sysimage.so";

in

pkgs.buildFHSUserEnv {
   name = juliaName;
   targetPkgs = allPackages;
   runScript = juliaCommand;
}
