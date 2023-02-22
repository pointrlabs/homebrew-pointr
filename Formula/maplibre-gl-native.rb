# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MaplibreGlNative < Formula
  desc ""
  homepage "https://maplibre.org"
  license "BSD-2-Clause"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch:"develop"
  url "https://github.com/pointrlabs/maplibre-gl-native.git", tag:"v0.5", revision:"309d9eed1f3cacb2a82d6cb4bee031965c215cde"

  depends_on "cmake" => [:build, "3.16"]
  depends_on "ninja" => [:build, "1.10.2"]
  on_linux do
    depends_on "llvm" => :build
  end
  depends_on "qt6" => "6.0.1"

  def install
    if OS.linux?
      system "cmake", "-S", ".", "-B", "build", "-G", "Ninja", "-DMBGL_WITH_QT=ON", "-DMBGL_QT_LIBRARY_ONLY=ON", "-DCMAKE_C_COMPILER=clang", "-DCMAKE_CXX_COMPILER=clang++", "-DMBGL_WITH_WERROR=OFF", "-DMBGL_QT_WITH_INTERNAL_SQLITE=ON", *std_cmake_args
    else
      system "cmake", "-S", ".", "-B", "build", "-G", "Ninja", "-DMBGL_WITH_QT=ON", "-DMBGL_QT_LIBRARY_ONLY=ON", *std_cmake_args
    end
    system "cmake", "--build", "build", "--target", "qmaplibregl"
    system "cmake", "--install", "build"
  end
end