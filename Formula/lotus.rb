# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.39.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.39.0/lotus_v1.39.0_darwin_arm64.tar.gz"
      sha256 "fea56e8f30477764b9c263b06ab84ce7dc4925f9ea13da5436148830acf7be2f"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.39.0/lotus_v1.39.0_linux_amd64_v1.tar.gz"
        sha256 "c498b7d05e6abd7d30b1279ead6c393ecda2c9f8f0bf00e4583401318857b0de"

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
