class Botan < Formula
  desc "Cryptographic algorithms and formats library in C++ (v2)"
  homepage "https://botan.randombit.net/"
  url "https://botan.randombit.net/releases/Botan-2.19.3.tar.xz"
  sha256 "dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55"
  license "BSD-2-Clause"
  head "https://github.com/randombit/botan.git", branch: "master"

  livecheck do
    url :homepage
    regex(/href=.*?Botan[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    root_url "https://github.com/pointrlabs/homebrew-vendor/releases/download/botan-2.19.3"
    rebuild 1
    sha256 ventura:      "7f3f4febea76ad40cf3e0428c2740e727dc93c9b2d178828bd5540c801599579"
    sha256 x86_64_linux: "8c7b7d3f9a190f75d4a1f1dd8e00571d5a013445303f218eb0d1f0406cd2e52c"
  end

  depends_on "pkg-config" => [:build, :test]
  depends_on "python@3.11"
  depends_on "sqlite"

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  fails_with gcc: "5"

  def install
    ENV.cxx11

    args = %W[
      --prefix=#{prefix}
      --docdir=share/doc
      --with-zlib
      --with-bzip2
      --with-sqlite3
    ]

    system "python3.11", "configure.py", *args
    system "make", "install"
  end

  test do
    (testpath/"test.txt").write "Homebrew"
    (testpath/"testout.txt").write shell_output("#{bin}/botan base64_enc test.txt")
    assert_match "Homebrew", shell_output("#{bin}/botan base64_dec testout.txt")
  end
end
