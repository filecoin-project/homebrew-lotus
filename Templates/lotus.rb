${HEADER}
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "${NODE_VERSION}"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "${NODE_MACOS_URL}"
    sha256 "${NODE_MACOS_SHA}"

    def install
      bin.install "lotus"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "${NODE_LINUX_INTEL_URL}"
        sha256 "${NODE_LINUX_INTEL_SHA}"

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
