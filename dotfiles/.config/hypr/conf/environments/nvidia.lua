hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


-- hl.env("__NV_PRIME_RENDER_OFFLOAD",1)
-- hl.env("__VK_LAYER_NV_optimus","NVIDIA_only")
-- hl.env("NVD_BACKEND","direct")

--  FOR VM and POSSIBLY NVIDIA
--hl.env("WLR_NO_HARDWARE_CURSORS",1) 
--hl.env("WLR_RENDERER_ALLOW_SOFTWARE",1)

-- # nvidia firefox (for hardware acceleration on FF)?
-- # check this post https://github.com/elFarto/nvidia-vaapi-driver#configuration
--hl.env("MOZ_DISABLE_RDD_SANDBOX",1)
--hl.env("EGL_PLATFORM","wayland")
