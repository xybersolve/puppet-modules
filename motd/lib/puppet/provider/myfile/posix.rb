Puppet::Type.type(:myfile).provide(:posix) do
  desc "Simple file support"
  
  def exits?
    File.exists?(@resource[:name])
  end
  
  def create 
    File.open(@resource[:name], "w") { |f| f.puts "" }
  end

  def destroy
    File.unlink(@resource[:name])
  end

end

  

