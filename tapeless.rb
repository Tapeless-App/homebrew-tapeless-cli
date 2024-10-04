# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tapeless < Formula
  desc "Tapeless CLI"
  homepage "https://tapeless.app"
  version "0.0.11"
  license "proprietary"

  on_macos do
    on_intel do
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.11/tapeless_Darwin_x86_64.tar.gz"
      sha256 "0cddba188acdf23da6c7d41a2ebca5f92b15465b4a7eb7b0cc5badaa92e10658"

      def install
        bin.install "tapeless"
      end
    end
    on_arm do
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.11/tapeless_Darwin_arm64.tar.gz"
      sha256 "f7d54ddb55125bf93a07e3435f5dc1981d5b43ea991c00c861c4e8def198582a"

      def install
        bin.install "tapeless"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.11/tapeless_Linux_x86_64.tar.gz"
        sha256 "f9b4a66866c3a22819970b753e3d4a1c0874b306432a9b2158c8cbf3b427e1c0"

        def install
          bin.install "tapeless"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.11/tapeless_Linux_arm64.tar.gz"
        sha256 "8e186caa1237523b1885da60bdf041a06e2df62f0622f67b17a89f31d4fa32c9"

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
