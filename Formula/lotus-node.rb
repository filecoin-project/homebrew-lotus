This file was generated - DO NOT EDIT
class LotusNode < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.28.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/galargh/lotus/releases/download/v1.28.0/lotus_v1.28.0_darwin_all.tar.gz"
    sha512 "b136229d85a09609e170061b41eda835e48140adf0de359078dfd626dfe45cb557cc5562a0c201ea19a7715b271765c49830c020dbe8d536cf81fa839bfe0867"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/galargh/lotus/releases/download/v1.28.0/lotus_v1.28.0_linux_amd64_v1.tar.gz"
        sha512 "1ec6eeec612b9423af209dc5d319c39da190c7863656a85074a6a971424da288003e0f5d0cdcfe6fdf64beb2e2004d0c70f56fac1800e2e59e7fb13f00f76ccc"

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
