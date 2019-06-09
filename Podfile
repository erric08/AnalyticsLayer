# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

platform :ios, '10.0'

inhibit_all_warnings!

$quick_version = '2.1.0'
$nimble_version = '8.0.1'
$fakery_version = '3.4.0'
$cuckoo_version = '0.12.0'
$objectMapper_version = '3.4.2'
$alamofire_version = '4.7.1'
$swiftyJson_version = '4.0.0'
$moengage_version = '4.3.2'
$fbsdk_version = '4.39.1'
$adjust_version = '4.17.1'

def testing_pods
  pod 'Quick', $quick_version
  pod 'Nimble', $nimble_version
  pod 'Fakery', $fakery_version
  pod 'Cuckoo', $cuckoo_version
  pod 'SpecLeaks', $specLeaks_version
end

target 'TwegApp' do
   use_frameworks!
   
   pod 'Alamofire', $alamofire_version
   pod 'SwiftyJSON', $swiftyJson_version
   pod 'ObjectMapper', $objectMapper_version
   
   pod 'MoEngage-iOS-SDK', $moengage_version
   pod 'Adjust', $adjust_version
   pod 'FBSDKCoreKit', $fbsdk_version

   target 'TwegAppTests' do
     inherit! :search_paths

     testing_pods
     pod 'Alamofire', $alamofire_version
     pod 'SwiftyJSON', $swiftyJson_version
     pod 'ObjectMapper', $objectMapper_version
   end
   
end


