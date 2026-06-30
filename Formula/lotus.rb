# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.36.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.36.1/lotus_v1.36.1_darwin_arm64.tar.gz"
      sha256 "923aafbe13dd5255d6954f2e7526f54b45dd41fa63ba155d891650c7efda1e58"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.36.1/lotus_v1.36.1_linux_amd64_v1.tar.gz"
        sha256 "bd9a4589c81512c69b4f7ecda65938dd7db85f89c847be71d813f36f62a35f61"

        def install
          bin.install "lotus"
        end
      end
    end
  end

  test do
    system "#{bin}/lotus --version"
  end
end
