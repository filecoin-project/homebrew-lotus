# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.0/lotus-miner_v1.34.0_darwin_all.tar.gz"
    sha256 "5b3e2c4aaf7052d38b5a5a3a64461d17d1907f440febbedd7582a3aca17da603"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.0/lotus-miner_v1.34.0_linux_amd64_v1.tar.gz"
        sha256 "02e8ebd2c9ade063221a362b2479759bc8fa35b04cda156c8eb7cbe232333905"

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
