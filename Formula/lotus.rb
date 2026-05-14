# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.36.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.36.0/lotus_v1.36.0_darwin_arm64.tar.gz"
      sha256 "a5051dd8f3d1bbf18500f9fbd40c92b2aa9acd8b999bea193231801df5f656dc"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.36.0/lotus_v1.36.0_linux_amd64_v1.tar.gz"
        sha256 "67ee5f7a18ea4a2bda1057916df4d5cb1f9a8b88aa8e82352f96ceb1bc1d637d"

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
