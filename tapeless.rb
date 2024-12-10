# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tapeless < Formula
  desc "Tapeless CLI"
  homepage "https://tapeless.app"
  version "0.1.2"
  license "proprietary"

  on_macos do
    on_intel do
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.1.2/tapeless_Darwin_x86_64.tar.gz"
      sha256 "78531648eaf726129dffa56b55f1290327d06425205140be92b119f9d741b43e"

      def install
        bin.install "tapeless"
      end
    end
    on_arm do
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.1.2/tapeless_Darwin_arm64.tar.gz"
      sha256 "dfc01b7e35e954409c9ebb8a369b03d0762e5fcad43480b6d60a48e2b96a52c8"

      def install
        bin.install "tapeless"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.1.2/tapeless_Linux_x86_64.tar.gz"
        sha256 "e03a1e5e67837cacb7e9aec29b0e4976dc8e7652588f63602529992174088b09"

        def install
          bin.install "tapeless"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.1.2/tapeless_Linux_arm64.tar.gz"
        sha256 "be95bb6a4dc6425ca1d04ce55d251cb5cbb1e1dd39a6cd871f0fe92e5409f40e"

        def install
          bin.install "tapeless"
        end
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tapeless version")
  end
end
