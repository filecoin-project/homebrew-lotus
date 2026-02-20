# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.35.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.35.0/lotus_v1.35.0_darwin_arm64.tar.gz"
      sha256 "4292027ec10c2955266f7fe8a11e217f770c60101e47e28069c19b59e5b3c1f7"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.35.0/lotus_v1.35.0_linux_amd64_v1.tar.gz"
        sha256 "4eda5a7a4952c9523a2b168829606874f02209631d60a59f751a90868e655192"

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
