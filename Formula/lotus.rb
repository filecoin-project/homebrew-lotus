class Lotus < Formula
  desc "lotus filecoin daemon and client"
  homepage "filecoin.io"
  url "https://github.com/filecoin-project/lotus/archive/refs/tags/v1.13.0.tar.gz"
  sha256 "62b51c56c8985fb9a4744ffe1f8b28f75916b632bfe39277dea8a1d75ebddc96"
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
