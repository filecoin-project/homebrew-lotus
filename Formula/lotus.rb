# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.38.3"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.38.3/lotus_v1.38.3_darwin_arm64.tar.gz"
      sha256 "d349c55b301634932bd89cc3f5481797d7bef12d77c52c7742f6ee28600b8a37"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.38.3/lotus_v1.38.3_linux_amd64_v1.tar.gz"
        sha256 "b3763765144d2138da12dd91c1f2aeb3991790a72cd422417ded89914c572c51"

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
