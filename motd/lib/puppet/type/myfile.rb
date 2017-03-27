Puppet::Type.newtype(:myfile) do
  desc "My File"
  ensurable 
  newparam(:path, :namevar => true) do
    desc "The file path"
  end
end
  
