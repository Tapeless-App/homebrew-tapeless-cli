class TapelessCli < Formula
  desc "Simply manage your tapeless projects and repositories from the CLI"
  homepage "https://github.com/Tapeless-App/Tapeless-CLI"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Darwin_x86_64.tar.gz"
      sha256 "c350e0064aa403d7dfe18350922720719e3878c37f553d86b792d53233e09471"
    elsif Hardware::CPU.arm?
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Darwin_arm64.tar.gz"
      sha256 "3c046ca23c4825d65c931d0ba8e602e11cf25510a5a4858e6d4a3cdf50a28398"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Linux_x86_64.tar.gz"
        sha256 "d60d5d1841f042a4ea92edf22dfdebb502d5302f62088890c7dcedc5ad6af34f"
      else
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Linux_i386.tar.gz"
        sha256 "4b11ec33950dcca186b7edc37eebae11dae638b4a0ba51cec500752c47541eaf"
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Linux_arm64.tar.gz"
      sha256 "631fcd7bfa36d0b965f7b938cce0c45d8e64ca688c82929f0f4c09000aca51a4"
    end
  end

  on_windows do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Windows_x86_64.zip"
        sha256 "20bc42d2d2613c3abcfafa3a56ec230848fbbebc086f4034c8913e7ea15eabf6"
      else
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Windows_i386.zip"
        sha256 "3b409eddbdb42d085c9d0b5ea6e20647995866915cf3f0d0c2fd709c9f218d22"
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.2/Tapeless-CLI_Windows_arm64.zip"
      sha256 "56f9b82b580bdd515539446a37a06957585dada51fd9d3b8323bb9d00b6fef71"
    end
  end


    # Option to build from source
  head "https://github.com/Tapeless-App/Tapeless-CLI.git", branch: "main"

  depends_on "go" => :build

  def install
    if build.head?
      ldflags = %W[
        -X tapeless.app/tapeless-cli/env.Version=#{version}
        -X tapeless.app/tapeless-cli/env.ApiURL=https://api.tapeless.app/cli
        -X tapeless.app/tapeless-cli/env.WebURL=https://tapeless.app
        -X tapeless.app/tapeless-cli/env.LoginCallbackPort=8080
      ]

      system "go", "build", "-o", bin/"tapeless", "-ldflags", ldflags.join(" "), "./"
    else
      bin.install "tapeless-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tapeless --version")
  end
end