# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.38.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.38.2/lotus_v1.38.2_darwin_arm64.tar.gz"
      sha256 "495037a1c87bda5ea52362c19763f35f0e5d3ded2e600b6268048ee0cd2f544f"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.38.2/lotus_v1.38.2_linux_amd64_v1.tar.gz"
        sha256 "479bf3f743ba7b80dfb8c43a205b309d060ad61abf913d3e4c245bd44f077a01"

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
