#
# Be sure to run `pod lib lint math_sqflite.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'math_sqflite'
  s.version          = '0.1.0'
  s.summary          = 'A short description of math_sqflite.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC

  s.homepage         = 'http://example.com'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '老王啊' => '13396196332@163.com' }
 
  s.source           = { :path => '.' }
  s.source_files = 'Classes/*','Classes/fmdb/*','Classes/sqlite/*'
 
  s.public_header_files = 'Classes/*.h'

  
  # s.resource_bundles = {
  #   'math_sqflite' => ['math_sqflite/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Flutter'
  #s.dependency 'FMDB', '~> 2.7'

  s.ios.deployment_target = '8.0'

  #s.pod_target_xcconfig = { '#include "SQLite.xcconfig"//'=>""  }
 
  s.xcconfig = { 
     'SQLLIBRARY_BASE_CFLAGS' => ' -DHAVE_USLEEP=1 -DSQLITE_HAVE_ISNAN -DSQLITE_ENABLE_API_ARMOR  -DSQLITE_POWERSAFE_OVERWRITE=1 -DSQLITE_DEFAULT_FILE_FORMAT=4 -DSQLITE_DEFAULT_AUTOVACUUM=1 -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_UPDATE_DELETE_LIMIT -DSQLITE_OMIT_AUTORESET  -DSQLITE_OMIT_LOAD_EXTENSION=1 -DSQLITE_SYSTEM_MALLOC -DSQLITE_THREADSAFE=2 -DSQLITE_OS_UNIX=1 -DSQLITE_ENABLE_JSON1 -DSQLITE_OMIT_COMPILEOPTION_DIAGS ',
    
     "SQLLIBRARY_IOS_ADDITIONAL_CFLAGS" => "-DSQLITE_ENABLE_LOCKING_STYLE=0 -DSQLITE_MAX_MMAP_SIZE=0 ",
     "SQLLIBRARY_CFLAGS" => "$(SQLLIBRARY_BASE_CFLAGS)",
     "SQLLIBRARY_CFLAGS[sdk=iphoneos*]" => "$(SQLLIBRARY_BASE_CFLAGS) $(SQLLIBRARY_IOS_ADDITIONAL_CFLAGS)",
     "SQLLIBRARY_RELEASE_CFLAGS" => "-DNDEBUG",
     "SQLLIBRARY_ARMV6_CFLAGS" => "-mno-thumb",
     "OTHER_CFLAGS" => "$(inherited) $(SQLLIBRARY_CFLAGS)",
     "OTHER_CFLAGS[arch=armv6]" => "$(inherited) $(SQLLIBRARY_ARMV6_CFLAGS) $(SQLLIBRARY_CFLAGS)",
     "OTHER_CFLAGS[config=Release]" => "$(inherited) $(SQLLIBRARY_CFLAGS) $(SQLLIBRARY_RELEASE_CFLAGS)",
     "OTHER_CFLAGS[config=Release][arch=armv6]" => "$(inherited) $(SQLLIBRARY_ARMV6_CFLAGS) $(SQLLIBRARY_CFLAGS) $(SQLLIBRARY_RELEASE_CFLAGS)",
    # "HEADER_SEARCH_PATHS" => '"$(PROJECT_DIR)" "${BUILT_PRODUCTS_DIR}" ',
    
     "SUPPORTED_PLATFORMS" => "iphoneos"

    



  }
end
