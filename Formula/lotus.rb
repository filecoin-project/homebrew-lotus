# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Lotus < Formula
  desc "A homebrew cask for installing filecoin-project/lotus on MacOS"
  homepage "https://filecoin.io"
  version "1.23.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.23.2/lotus_v1.23.2_darwin_all.tar.gz"
    sha256 "87c865aff7852f13634966e1fd89a8daa0bf648eedb5240addbd778bc4e9bcfd"

    def install
      bin.install "lotus"
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/filecoin-project/lotus/releases/download/v1.23.2/lotus_v1.23.2_linux_amd64.tar.gz"
      sha256 "d16cf5856890f32292641897e11f3bb4691357407b872c948a91fc65336cfb86"

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
