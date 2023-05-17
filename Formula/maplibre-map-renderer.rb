class MaplibreMapRenderer < Formula
  desc "Renders and produces raster images from Maplibre maps"
  homepage "https://github.com/pointrlabs/maplibre-gl-native/tree/develop/map-renderer"
  url "https://github.com/pointrlabs/maplibre-gl-native.git", tag: "version/map-renderer/1.0", revision: "30434314e43ae0145a2c67ccbd6b07f1229f4c5b"
  license "MIT"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch: "develop"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "glfw"
  depends_on "libuv"
  uses_from_macos "curl"

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
      "-DMBGL_WITH_MAP_RENDERER=ON", "-DMBGL_WITH_WERROR=OFF",
      *std_cmake_args
    system "cmake", "--build", "build", "--target", "map-renderer"
    system "cmake", "--install", "build"
  end
end
