# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.36.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.36.2/lotus_v1.36.2_darwin_arm64.tar.gz"
      sha256 "ffb07efc8930b92d32e6c9b7af48fe97af52410dbe5f4fd8c1424148dcffa075"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.36.2/lotus_v1.36.2_linux_amd64_v1.tar.gz"
        sha256 "fc490061d2f153ee73c8679b5e9ae379829c2e2ab6b2154d861b37a3a4d92fe2"

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
