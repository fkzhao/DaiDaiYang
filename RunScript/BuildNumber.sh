buildNumber=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")  
shortVersion=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "${PROJECT_DIR}/${INFOPLIST_FILE}")  
  
buildNumber=${buildNumber##*.}
buildNumber=$(($buildNumber + 1))  

buildNumber="$shortVersion.$buildNumber" 

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "${PROJECT_DIR}/${INFOPLIST_FILE}"  