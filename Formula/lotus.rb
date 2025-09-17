# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.34.1/lotus_v1.34.1_darwin_all.tar.gz"
    sha256 "89c261c8a61e044ee82c0099e7a87b392b05a305b7294fa6e819ab4c1e370d2c"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.34.1/lotus_v1.34.1_linux_amd64_v1.tar.gz"
        sha256 "bd6027f06892dfde9d530d4f3f4316bc88ce28b4aed3753f305559613776bc71"

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
