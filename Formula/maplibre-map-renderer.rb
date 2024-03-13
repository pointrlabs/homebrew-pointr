class MaplibreMapRenderer < Formula
  desc "Renders and produces raster images from Maplibre maps"
  homepage "https://github.com/pointrlabs/maplibre-gl-native/tree/develop/map-renderer"
  url "https://github.com/pointrlabs/maplibre-gl-native.git", tag: "version/map-renderer/1.0", revision: "30434314e43ae0145a2c67ccbd6b07f1229f4c5b"
  license "MIT"
  head "https://github.com/pointrlabs/maplibre-gl-native.git", branch: "develop"

  bottle do
    root_url "https://github.com/pointrlabs/homebrew-vendor/releases/download/maplibre-map-renderer-1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "e209718f2dc1d5977e388aebae44ced38021a3eff337be47c1cb86c8a98ef981"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1d5c9dd4cbf046d90d6fdd136a11d3a5a16596205215e27d199b343f02c24529"
    sha256 cellar: :any_skip_relocation, ventura:        "8788c2cf89b6e39595cc7a448cd7e19becd2be8bba90f0428611e237245b4ad1"
    sha256 cellar: :any_skip_relocation, monterey:       "7907347257e3a34bdd95917278472b9efa40ad783fcb39931b610dce2794a643"
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  uses_from_macos "curl"
  on_linux do
    depends_on "libuv"
    depends_on "mesa-glu"
    depends_on "mesalib-glw"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
      "-DMBGL_WITH_MAP_RENDERER=ON", "-DMBGL_WITH_WERROR=OFF",
      *std_cmake_args
    system "cmake", "--build", "build", "--target", "map-renderer", "mbgl-render-test-runner"
    system "cmake", "--install", "build"
  end
end
