project "gmscript"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	
	targetdir ("bin/" .. outputDir .. "%{prj.name}")
	objdir ("bin-int/" .. outputDir .. "%{prj.name}")
	
	files {
		"gmsrc/src/gm/**.cpp",
		"gmsrc/src/gm/**.h",
		"gmsrc/src/binds/**.cpp",
		"gmsrc/src/binds/**.h",
	}
	
	platformConfig = "gmsrc/src/platform/win32msvc"
	
	files {
		"%{platformConfig}/gmConfig_p.h"
	}
	
	includedirs {
		"%{platformConfig}/",
		"gmsrc/src/gm"
	}
	
	undefines {
		"UNICODE"
	}
	
	defines {
		"WIN32"
	}
	
	filter "configurations:Debug"
        defines {"ENGINE_DEBUG"}
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines {"ENGINE_RELEASE"}
        runtime "Release"
	    optimize "On"

	filter "configurations:Distribute"
        defines {"ENGINE_DIST"}
        runtime "Release"
		optimize "On"
