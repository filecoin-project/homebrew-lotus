# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.33.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.33.0/lotus_v1.33.0_darwin_all.tar.gz"
    sha256 "ec01b0794722de19eabcf4fe658841f5268f1fb1047b9cf1fa3ca5229aff0daa"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.33.0/lotus_v1.33.0_linux_amd64_v1.tar.gz"
        sha256 "6f5824836ca1f20e09caf64965d429980687bc081d5a84c8e12ae6c610f432e8"

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
