# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.34.0/lotus_v1.34.0_darwin_all.tar.gz"
    sha256 "1fee0025d84625b246805f9cd531f08710bfa2db6a877fb13fcbab60e0dbc443"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.34.0/lotus_v1.34.0_linux_amd64_v1.tar.gz"
        sha256 "6e8da2b72f583af7275058e893c985ac086f8b849976116558ae8f9d3889fe22"

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
