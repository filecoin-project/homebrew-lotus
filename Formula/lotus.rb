# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.32.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.32.1/lotus_v1.32.1_darwin_all.tar.gz"
    sha256 "327859366a5ce1266752f82a2afe3be3294fcf175004cf49173498f66c736e91"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.32.1/lotus_v1.32.1_linux_amd64_v1.tar.gz"
        sha256 "b6c2e3dd677f9340bb02bf535b13a52c488abd7f0cda87742b9039d0a1871f1f"

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
