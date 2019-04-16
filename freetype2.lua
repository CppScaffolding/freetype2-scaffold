-- scaffold geniefile for freetype2

freetype2_script = path.getabsolute(path.getdirectory(_SCRIPT))
freetype2_root = path.join(freetype2_script, "freetype2")

freetype2_includedirs = {
	path.join(freetype2_script, "config"),
	freetype2_root,
}

freetype2_libdirs = {}
freetype2_links = {}
freetype2_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { freetype2_includedirs }
	end,

	_add_defines = function()
		defines { freetype2_defines }
	end,

	_add_libdirs = function()
		libdirs { freetype2_libdirs }
	end,

	_add_external_links = function()
		links { freetype2_links }
	end,

	_add_self_links = function()
		links { "freetype2" }
	end,

	_create_projects = function()

project "freetype2"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		freetype2_includedirs,
	}

	defines {}

	files {
		path.join(freetype2_script, "config", "**.h"),
		path.join(freetype2_root, "**.h"),
		path.join(freetype2_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
