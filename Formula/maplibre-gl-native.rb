class MaplibreGlNative < Formula
  desc "Pointr-flavored Maplibre GL Native"
  homepage "https://maplibre.org"
  url "https://github.com/pointrlabs/maplibre-gl-native.git", tag: "v0.5", revision: "309d9eed1f3cacb2a82d6cb4bee031965c215cde"
  license "BSD-2-Clause"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch: "develop"

  bottle do
    root_url "https://github.com/pointrlabs/homebrew-vendor/releases/download/maplibre-gl-native-0.5"
    rebuild 1
    sha256 cellar: :any,                 ventura:      "b09808287c3e7b1b7d30f3bbfbfd465430ecab5d0a02466fb0915ec856ab4de0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2dca19547b2ae447294c238150f12a043fb753426ee3e73d09eaf26192b40d1"
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "qt6"

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
      "-DMBGL_WITH_QT=ON", "-DMBGL_QT_LIBRARY_ONLY=ON", "-DMBGL_QT_WITH_INTERNAL_SQLITE=ON", "-DMBGL_WITH_WERROR=OFF",
      *std_cmake_args
    system "cmake", "--build", "build", "--target", "qmaplibregl"
    system "cmake", "--install", "build"
  end
end
