# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MaplibreGlNative < Formula
  desc ""
  homepage "https://maplibre.org"
  license "BSD-2-Clause"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch: "develop"

  depends_on "cmake" => :build
  #depends_on "ninja" => :build

  def install
    system "cmake -S . -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=#{prefix} -DMBGL_WITH_QT=ON -DMBGL_QT_LIBRARY_ONLY=ON -DMBGL_WITH_WERROR=OFF"
    system "cmake --build build --target qmapboxgl"
    system "cmake --install build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test maplibre-gl-native`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
