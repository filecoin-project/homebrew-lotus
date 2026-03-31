# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.35.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.35.1/lotus_v1.35.1_darwin_arm64.tar.gz"
      sha256 "1a086a36463f735c05f173b1aa036bc1c926fb28a7124bda8922d4d787120aaf"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.35.1/lotus_v1.35.1_linux_amd64_v1.tar.gz"
        sha256 "53bf47ba63b4ddc6afe12e9eda28e9dfd76a7e4a3174f3bd44523110f7f61802"

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
