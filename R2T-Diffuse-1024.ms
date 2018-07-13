obj = selection[1] -- get the selected object;

obj.iNodeBakeProperties.removeAllBakeElements() -- clear out any current settings just in case

dm = diffusemap()

size = 1024 -- the test says high-poly so I figure 1024 is probably enough
-- i seen a way to make this take an input from the user, but the script is just as long as this one so I'll leave that for later
dm.outputSzX = dm.outputSzY = size -- set the output size to the size set

dm.fileType = (getDir #image+"\\"+obj.name+"_diffuse.tga") -- set file type
dm.fileName = filenameFromPath dm.fileType -- set file name
dm.filterOn = true -- enable filtering
dm.shadowsOn = false -- disable shadows
dm.lightingOn = false -- disable lighting
dm.enabled = true -- enable baking

bp = obj.INodeBakeProperties -- keeping code DRY

bp.addBakeElement dm -- add first element
bp.bakeEnabled = true -- enabling baking
bp.bakeChannel = 1 -- channel to bake
bp.nDilations = 1 -- expand the texture a bit

render rendertype:#bakeSelected vfb:off progressBar:true outputSize:[size,size] -- do the render!