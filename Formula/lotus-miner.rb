This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.28.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/galargh/lotus/releases/download/miner/v1.28.0/lotus-miner_v1.28.0_darwin_all.tar.gz"
    sha512 "f236a6c5ecfd758be90dcb0c20f88e6214f9684a7d718f12f55096883e2f70d020f7f21b0e29c50c6e6d29aa476af1afdd21623316590a51a4e463e5b13dd091"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/galargh/lotus/releases/download/miner/v1.28.0/lotus-miner_v1.28.0_linux_amd64_v1.tar.gz"
        sha512 "3b38c45295268ced21b52e892ec4288adaa2a9882c983af318e53ecd5afc1036406abd107e7c07fc88b69b9af1b796b82b61e6085e93a63d9fb659f847b3f4bb"

        def install
          bin.install "lotus-miner"
          bin.install "lotus-worker"
        end
      end
    end
  end

  test do
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
