require 'formula'

class GdbCrossElf < Formula
  homepage 'https://google.ro'
  url 'https://raw.githubusercontent.com/2mia/homebrew-gdb-cross-elf/master/gdb.tar.gz'
  version '0.0.1'
  sha256 'c0013102a4e2db18d433f7b21e7f7930ccaf66126036de3c4366440b4f981ee9'

  bottle :unneeded

  def install
    raise 'you already have gdb scripts already in place at /usr/local/share/gdb"' unless not File.exist?("/usr/local/share/gdb")
    bin.install 'local/bin/gdb'
    pkgshare.install 'local/share/gdb/'
    #system "whoami; ln -s #{pkgshare}/gdb /usr/local/share/gdb"
  end
  
  def caveats; <<~EOS
    You'll need to add python scripts to gdb directory:
        ln -s #{pkgshare}/gdb /usr/local/share/gdb
    EOS
  end
end
