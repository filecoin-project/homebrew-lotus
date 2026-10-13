# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.38.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.38.1/lotus_v1.38.1_darwin_arm64.tar.gz"
      sha256 "c362faf99571a7aa749b70ea7d134f8ef4cc75f4aadee7df39a2bc970520896c"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.38.1/lotus_v1.38.1_linux_amd64_v1.tar.gz"
        sha256 "63a4b5343584561a27ab32617bc37c8a48239c62fff0828f80f82f4d38e8f2ff"

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
