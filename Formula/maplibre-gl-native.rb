# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MaplibreGlNative < Formula
  desc ""
  homepage "https://maplibre.org"
  license "BSD-2-Clause"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", tag:"v0.3" ,revision:"5a384e7140538f0c543c35fe9bbb3b7759e61e0e"

  depends_on "cmake" => [:build, "3.16"]
  depends_on "qt6" => "6.0.1"
  depends_on "ninja" => :build

  def install
    system "cmake -S . -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=#{prefix} -DMBGL_WITH_QT=ON -DMBGL_QT_LIBRARY_ONLY=ON"
    system "cmake --build build --target qmaplibregl"
    system "cmake --install build"
  end
end