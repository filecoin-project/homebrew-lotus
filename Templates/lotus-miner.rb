${HEADER}
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "${MINER_VERSION}"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "${MINER_MACOS_URL}"
    sha512 "${MINER_MACOS_SHA}"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "${MINER_LINUX_INTEL_URL}"
        sha512 "${MINER_LINUX_INTEL_SHA}"

        def install
          bin.install "lotus-miner"
          bin.install "lotus-worker"
        end
      end
    end
  end

  test do
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
