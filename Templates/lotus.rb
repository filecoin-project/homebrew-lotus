${HEADER}
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus project from filecoin-project/lotus"
  homepage "https://filecoin.io"
  license "MIT"

  depends_on "lotus-node"
  depends_on "lotus-miner"

  test do
    system "#{bin}/lotus", "--version"
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
