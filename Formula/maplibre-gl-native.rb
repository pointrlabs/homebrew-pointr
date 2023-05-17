class MaplibreGlNative < Formula
  desc "Pointr-flavored Maplibre GL Native"
  homepage "https://maplibre.org"
  url "https://github.com/pointrlabs/maplibre-gl-native.git", tag: "v0.5", revision: "309d9eed1f3cacb2a82d6cb4bee031965c215cde"
  license "BSD-2-Clause"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch: "develop"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "qt6"

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
      "-DMBGL_WITH_QT=ON", "-DMBGL_QT_LIBRARY_ONLY=ON", "-DMBGL_WITH_WERROR=OFF", "-DMBGL_QT_WITH_INTERNAL_SQLITE=ON",
      *std_cmake_args
    system "cmake", "--build", "build", "--target", "qmaplibregl"
    system "cmake", "--install", "build"
  end
end
