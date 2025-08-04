# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.33.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.33.1/lotus_v1.33.1_darwin_all.tar.gz"
    sha256 "bb7673f51270604855695dfd55f79e1b8f97c255a61c771dabe8e0270c5897f2"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.33.1/lotus_v1.33.1_linux_amd64_v1.tar.gz"
        sha256 "8bb664f7e65e2b07821bd268e3b0e60a9dabf7fae7e9ec6339a716bc8f9b554c"

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
