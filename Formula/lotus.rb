# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.4"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.34.4/lotus_v1.34.4_darwin_arm64.tar.gz"
      sha256 "0407e4c3efe7eb825fae32fb8fdd331096f9a887d22599bb71e9c3134f9e0807"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.34.4/lotus_v1.34.4_linux_amd64_v1.tar.gz"
        sha256 "40e2877a7c990be124bb50e2ee8275862f5014df4820d4d249237c14785261a7"

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
