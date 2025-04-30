# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.32.3"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.32.3/lotus_v1.32.3_darwin_all.tar.gz"
    sha256 "bf5863853e6eb1e19c6228a5121e1700a368258440a42541f37a64985c75f4b5"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.32.3/lotus_v1.32.3_linux_amd64_v1.tar.gz"
        sha256 "91e29175101a1f06674e23cd1ae8e8700941872021a013d4c413dbb9e6ddbcee"

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
