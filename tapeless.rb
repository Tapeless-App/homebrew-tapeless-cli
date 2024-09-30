class Tapeless < Formula
  desc "Your CLI tool description"
  homepage "https://github.com/Tapeless-App/Tapeless-CLI"
  version "0.0.2"
  license "MIT" # Replace with the actual license of your project

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Darwin_arm64.tar.gz"
    sha256 "3c046ca23c4825d65c931d0ba8e602e11cf25510a5a4858e6d4a3cdf50a28398"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Darwin_x86_64.tar.gz"
    sha256 "c350e0064aa403d7dfe18350922720719e3878c37f553d86b792d53233e09471"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Linux_arm64.tar.gz"
    sha256 "631fcd7bfa36d0b965f7b938cce0c45d8e64ca688c82929f0f4c09000aca51a4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Linux_x86_64.tar.gz"
    sha256 "d60d5d1841f042a4ea92edf22dfdebb502d5302f62088890c7dcedc5ad6af34f"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "tapeless"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tapeless version")
  end
end


  #   # Option to build from source
  # head "https://github.com/Tapeless-App/Tapeless-CLI.git", branch: "main"

  # depends_on "go" => :build

  # def install
  #   if build.head?
  #     ldflags = %W[
  #       -X tapeless.app/tapeless-cli/env.Version=#{version}
  #       -X tapeless.app/tapeless-cli/env.ApiURL=https://api.tapeless.app/cli
  #       -X tapeless.app/tapeless-cli/env.WebURL=https://tapeless.app
  #       -X tapeless.app/tapeless-cli/env.LoginCallbackPort=8080
  #     ]

  #     system "go", "build", "-o", bin/"tapeless", "-ldflags", ldflags.join(" "), "./"
  #   else
  #     bin.install "tapeless"
  #   end
  # end