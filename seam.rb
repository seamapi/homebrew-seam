require "language/node"

class Seam < Formula
  desc "This utility lets you control Seam resources"
  homepage "https://github.com/seamapi/seam-cli"
  url "https://github.com/seamapi/seam-cli/archive/refs/tags/0.0.32.tar.gz"
  sha256 "3abeb447476ae480f78f9d64152caff65ae3dca57c0c254321169f2a5820d2a9"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    system "npm", "run", "build"
    bin.install "bin/seam.cjs" => "seam"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/seam --version")
  end
end
