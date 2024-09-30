class TapelessCli < Formula
  desc "Simply manage your tapeless projects and repositories from the CLI"
  homepage "https://github.com/Tapeless-App/Tapeless-CLI"
  url "https://github.com/Tapeless-App/Tapeless-CLI/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "99e04450288665d2e49bf2f9cac549091e0ee50ef4fc901f2b02b7324d8267f6"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X tapeless.app/tapeless-cli/env.Version=#{version}
      -X tapeless.app/tapeless-cli/env.ApiURL=https://api.tapeless.app/cli
      -X tapeless.app/tapeless-cli/env.WebURL=https://tapeless.app
      -X tapeless.app/tapeless-cli/env.LoginCallbackPort=8080
    ]

    system "go", "build", "-o", bin/"tapeless", "-ldflags", ldflags.join(" "), "./"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tapeless --version")
  end
end