class Ferry < Formula
  desc "Send photos, videos and files between your phone and computer over Wi-Fi"
  homepage "https://github.com/lenajeremy/ferry"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.1/ferry-cli-macos-arm64"
      sha256 "6b2c1a6f428d6d61eb6deb712d9edfd80681c1b3cd2257269e2778b618749d05"
    end
    on_intel do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.1/ferry-cli-macos-amd64"
      sha256 "2bb88a56b876e48847d7ef37b56afb509c3946782ca32f01eea45aed35e3c3a3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.1/ferry-cli-linux-arm64"
      sha256 "c3c1118c9f2654f231fd6a5776e94300aba5dd1fea6b81aacc22619cad5e40b5"
    end
    on_intel do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.1/ferry-cli-linux-amd64"
      sha256 "cb6294878b294c61e234b9e89fcd763d09f30ff82b7a045a6e9da00aa61161b8"
    end
  end

  def install
    bin.install Dir["ferry-cli-*"].first => "ferry"
  end

  service do
    run [opt_bin/"ferry", "-open=false"]
    keep_alive true
    log_path var/"log/ferry.log"
    error_log_path var/"log/ferry.log"
  end

  def caveats
    <<~EOS
      Start Ferry now and whenever you log in:
        brew services start ferry
      Then open http://localhost:7070 and scan the code with your phone.
      Your files are shared from ~/Ferry.
    EOS
  end

  test do
    assert_match "the shared folder", shell_output("#{bin}/ferry -h 2>&1")
  end
end
