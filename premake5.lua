NAME="las"

workspace (NAME)
   configurations { "Debug", "Release" }

project ("lib"..NAME)
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { }
   buildoptions { "-Wall", "-fsanitize=address", "-pedantic" }
   linkoptions { "-fsanitize=address" }

   files { "include/**.h", "src/**.c" }
   includedirs { "include" }
   removefiles { "src/test*", "include/test*", "src/main.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"


project (NAME)
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "argtable2" }
   -- links { "lib"..NAME }
   buildoptions { "-Wall", "-fsanitize=address", "-pedantic" }
   linkoptions { "-fsanitize=address" }

   files { "include/**.h", "src/**.c" }
   includedirs { "include" }
   removefiles { "src/test*", "include/test*" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"


project ("test"..NAME)
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "cmocka" }
   buildoptions { "-Wall", "-fsanitize=address", "-pedantic" }
   linkoptions { "-fsanitize=address" }

   files { "include/**.h", "src/**.c" }
   includedirs { "include" }
   removefiles { "src/main.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

