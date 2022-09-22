# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MaplibreMapRenderer < Formula
  desc ""
  homepage "https://maplibre.org"
  license "BSD-2-Clause"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch:"develop"
  url "https://github.com/pointrlabs/maplibre-gl-native.git", tag:"version/map-renderer/1.0", revision:"30434314e43ae0145a2c67ccbd6b07f1229f4c5b"

  depends_on "cmake" => [:build, "3.16"]
  depends_on "ninja" => [:build, "1.10.2"]

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja", "-DMBGL_WITH_MAP_RENDERER=ON", *std_cmake_args
    system "cmake", "--build", "build", "--target", "map-renderer"
    system "cmake", "--install", "build"
  end
end