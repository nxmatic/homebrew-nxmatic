class Jx < Formula
  desc "a simple small new modular CLI for Jenkins X v3"
  homepage "https://github.com/jenkins-x/jx"
  url "https://github.com/jenkins-x/jx/releases/download/v3.2.196/jx-darwin-amd64.tar.gz"
  sha256 "71d728966a4afd2cbc7cbc047e455446ae7157215597e84f437de4fd636d7d77"
  license "Apache-2.0"


  # depends_on "cmake" => :build

  def install
    bin.install "jx"
    output = Utils.popen_read("SHELL=bash #{bin}/jx completion bash")
    (bash_completion/"jx").write output

    prefix.install_metafiles
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test jx-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
