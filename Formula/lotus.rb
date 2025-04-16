# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.32.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.32.2/lotus_v1.32.2_darwin_all.tar.gz"
    sha256 "8435f272554388fe835fb1d47e0585309750e8c5a47f6566535cf0c539bcc1c0"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.32.2/lotus_v1.32.2_linux_amd64_v1.tar.gz"
        sha256 "30778fcdf4ff664dd74deca4b399bbb88b42cc6cd5f9d1955115a0093201b6f6"

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
