class Lotus < Formula
  desc "lotus filecoin daemon and client"
  homepage "filecoin.io"
  url "https://github.com/filecoin-project/lotus/releases/download/v1.16.0/lotus_v1.16.0_darwin-amd64.tar.gz"
  sha256 "906a48d8b3be055eeb128acf89c9e1636e932c4dc2c88ef68ebcfc6d84667cf5"
  license "Apache-2.0/MIT"
  head "https://github.com/filecoin-project/lotus"

  depends_on "pkg-config" => :build
  depends_on "go"         => :build
  depends_on "jq"         => :build
  depends_on "bzr"        => :build
  depends_on "rustup-init" => :build
  depends_on "hwloc"

  def arch_M1
    IO.popen(['arch']).read.strip === 'arm64'
  end

  # def install_submodules
  #   system "git clone --recurse-submodules https://github.com/filecoin-project/filecoin-ffi.git extern/filecoin-ffi"
  #   system "git clone --recurse-submodules https://github.com/filecoin-project/serialization-vectors.git extern/serialization-vectors"
  #   system "git clone --recurse-submodules https://github.com/filecoin-project/test-vectors.git extern/test-vectors"
  #   system "touch build/.update-modules"
  # end

  # def build_filecoin_ffi
  #   ## First install rust to prevent Error on filecoin-ffi build:
  #   ##    ++ command -v rustup
  #   ##    + '[' -x '' ']'
  #   ##    + echo '[build_from_source] Error: rustup is not installed.'
  #   ##    [build_from_source] Error: rustup is not installed.
  #   ##    + echo '[build_from_source] install Rust toolchain installer to resolve this problem.'
  #   ##    [build_from_source] install Rust toolchain installer to resolve this problem.
  #   ##    + exit 1

  #   # Set cargo_home to local directory
  #   system 'mkdir -p extern/cargo_home'
  #   ENV['CARGO_HOME'] = 'extern/cargo_home'
  #   system 'rustup-init -y'

  #   # Set environment variables so M1 mac
  #   ENV['LIBRARY_PATH'] = "#{ENV['HOMEBREW_PREFIX']}/lib"
  #   ENV['FFI_BUILD_FROM_SOURCE'] = '1'
  #   cargo_bin = "#{IO.popen(['pwd']).read.strip}/extern/cargo_home/bin"
  #   ENV['PATH'] += ":#{cargo_bin}"
  #   puts "PATH = #{ENV['PATH']}"

  #   # Build filecoin-ffi from source for Mac M1
  #   system 'cd extern/filecoin-ffi && make'


  #   system 'go mod download github.com/filecoin-project/go-state-types'
  #   system 'go get github.com/filecoin-project/filecoin-ffi@v0.30.4-0.20200910194244-f640612a1a1f'
  # end

  def install

    # update submodules
    # install_submodules

    # build_filecoin_ffi if arch_M1

    # make
    # system "go mod tidy"
    # system "make lotus"
    system "mv lotus lotus2; cat lotus2 >lotus; chmod +x lotus"
    bin.install "lotus"
    bin.install "lotus-miner"
    bin.install "lotus-worker"
  end
end
