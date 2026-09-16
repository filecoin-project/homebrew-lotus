# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.36.3"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.36.3/lotus_v1.36.3_darwin_arm64.tar.gz"
      sha256 "9d1f441b884dd9186474ca4c08b2c716208c672dc256d876ae9a408fa1d426d4"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.36.3/lotus_v1.36.3_linux_amd64_v1.tar.gz"
        sha256 "4f9f513375446ac00793490270512f0856aca2ad4e09f86ec7ec1eef1e852d2a"

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
