# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Lotus < Formula
  desc "A homebrew cask for installing filecoin-project/lotus on MacOS"
  homepage "https://filecoin.io"
  version "1.22.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.22.2/lotus_v1.22.2_darwin_all.tar.gz"
    sha256 "b5f6b39a871304064215cfc4fdef25113f77a0bfc89effe07fa86e69feae1ffa"

    def install
      bin.install "lotus"
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/filecoin-project/lotus/releases/download/v1.22.2/lotus_v1.22.2_linux_amd64.tar.gz"
      sha256 "5a32d9348ccc51423597a246ef985966ae6aeddf5fa49b64105c114f7a77ba79"

      def install
        bin.install "lotus"
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  test do
    system "#{bin}/lotus --version"
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
