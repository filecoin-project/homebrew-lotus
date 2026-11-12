# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.39.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.39.1/lotus_v1.39.1_darwin_arm64.tar.gz"
      sha256 "60e5e4cd7c0cc3b9176e8746af704af33080913d8b9536b920d96fb0383117f7"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.39.1/lotus_v1.39.1_linux_amd64_v1.tar.gz"
        sha256 "2c6950612f5bbcc0516bdc90e918fedef881e8c0686e8370de791adbddeeb482"

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
