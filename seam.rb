require "language/node"
require "json"

class Seam < Formula
  desc "This utility lets you control Seam resources"
  homepage "https://github.com/seamapi/seam-cli"
  url "https://registry.npmjs.org/seam-cli/-/seam-cli-0.0.38.tgz"
  sha256 "fbf397e21c4f6f93db89465f11f819399ef5f76076060a7aa4585d28667129dc"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
  test do
    system "#{bin}/seam", "config", "set", "fake-server"
  end  
end
