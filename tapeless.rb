class Tapeless < Formula
  desc "Your CLI tool description"
  homepage "https://github.com/Tapeless-App/Tapeless-CLI"
  version "0.0.3"
  license "MIT" # Replace with the actual license of your project

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.3/tapeless_Darwin_arm64.tar.gz"
    sha256 "08e00c2860ee85287e0109916098295fc1776712635f7a1567bcb77973d71a65"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.3/tapeless_Darwin_x86_64.tar.gz"
    sha256 "866d054d307d68f56c25605e37f055dc68e2ecf582b6b3dab3ae1986bd30596b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.3/tapeless_Linux_arm64.tar.gz"
    sha256 "c32596cab54d588e75cd703fa35b6b75170c14420862a1affc26ecd2cb9e2a97"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.3/tapeless_Linux_x86_64.tar.gz"
    sha256 "817229da3a7867d0ccc5473dc969d555d6c3b03be068e79164ab436f0905ddb2"
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