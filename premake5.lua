project "SPIRV-Cross"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ( "../../../build/" .. outputdir .. "/%{prj.name}" )
    objdir ( "../../../build-int/" .. outputdir .. "/%{prj.name}" )

    files {
        "./src/**.cpp",
		"./src/**.hpp",
		"./src/**.h",
		"./include/**.cpp",
		"./include/**.hpp",
		"./include/**.h"
    }

    includedirs {
        "./include",
        "./src"
    }

    filter "system:windows"
        systemversion "latest"

    filter "system:macosx"
        xcodebuildsettings
        {
            ["MACOSX_DEPLOYMENT_TARGET"] = "10.15",
            ["USeModernBuildSystem"] = "NO"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
		defines { "_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH " }

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter {}
