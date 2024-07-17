This file was generated - DO NOT EDIT
class LotusNode < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.27.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/galargh/lotus/releases/download/v1.27.1/lotus_v1.27.1_darwin_all.tar.gz"
    sha256 "some"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/galargh/lotus/releases/download/v1.27.1/lotus_v1.27.1_linux_amd64_v1.tar.gz"
        sha256 "some"

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
