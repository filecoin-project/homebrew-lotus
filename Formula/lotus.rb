class Lotus < Formula
  desc "lotus filecoin daemon and client"
  homepage "filecoin.io"
  url "https://github.com/filecoin-project/lotus/archive/refs/tags/v1.11.3.tar.gz"
  sha256 "0bb2d268c6796f4200c66fafa6943361749a05ce411b601123b1e38cd79114ec"
  license "Apache-2.0/MIT"
  head "https://github.com/filecoin-project/lotus"

  depends_on "pkg-config" => :build
  depends_on "go"         => :build
  depends_on "jq"         => :build
  depends_on "hwloc"

  def install
    # update submodules
    system "git clone https://github.com/filecoin-project/filecoin-ffi.git extern/filecoin-ffi"
    system "git clone https://github.com/filecoin-project/serialization-vectors.git extern/serialization-vectors"
    system "git clone https://github.com/filecoin-project/test-vectors.git extern/test-vectors"
    system "touch build/.update-modules"

    # make
    system "make all"
    bin.install "lotus"
    bin.install "lotus-miner"
    bin.install "lotus-worker"
  end
end
