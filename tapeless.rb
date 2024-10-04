# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tapeless < Formula
  desc "Tapeless CLI"
  homepage "https://tapeless.app"
  version "0.0.10"
  license "proprietary"

  on_macos do
    on_intel do
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.10/tapeless_Darwin_x86_64.tar.gz"
      sha256 "b2d2390e297aa0e82b18e070857132c948d0ffff701661982eeae617e24c45f4"

      def install
        bin.install "tapeless"
      end
    end
    on_arm do
      url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.10/tapeless_Darwin_arm64.tar.gz"
      sha256 "e1f7b04f4e2e13f2cab6ff5eee8ba62a4779b54b87322fdd75b97b2b20c21e93"

      def install
        bin.install "tapeless"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.10/tapeless_Linux_x86_64.tar.gz"
        sha256 "2d9b75fd25287b4809bef892788542b484e61759c04ff14785e240629a08c870"

        def install
          bin.install "tapeless"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/Tapeless-App/Tapeless-CLI/releases/download/v0.0.10/tapeless_Linux_arm64.tar.gz"
        sha256 "b9b1233c5799532e0373d4ba5df355bff26dc3aa857111fe844db57e93a0bec8"

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
