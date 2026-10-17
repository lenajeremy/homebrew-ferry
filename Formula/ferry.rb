class Ferry < Formula
  desc "Send photos, videos and files between your phone and computer over Wi-Fi"
  homepage "https://github.com/lenajeremy/ferry"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.0/ferry-cli-macos-arm64"
      sha256 "266131b28d037ea83fadbb0f8ac031b6d4250eaa57a673c637c7a4d937a7708e"
    end
    on_intel do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.0/ferry-cli-macos-amd64"
      sha256 "a62c2cf2eef543bbdeba667ac426152507ce0af01c095f6d65a0421e70bdd4c2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.0/ferry-cli-linux-arm64"
      sha256 "51c0ca2e4ab59306528042087f994f697c49d5b147080275726a5d529bfa7526"
    end
    on_intel do
      url "https://github.com/lenajeremy/ferry/releases/download/v1.0.0/ferry-cli-linux-amd64"
      sha256 "b122f944822bae15c6e5dd91a54176f1b83af733a8a4be7e465620b33f7b7266"
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
