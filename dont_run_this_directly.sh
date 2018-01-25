#"./changer.sh " + CORE_POM_FILE + " " + PLUGIN_POM_FILE + " " + IOS_PLUGIN_POM_FILE + " " + PRODUCT_POM_FILE + " " + coreVersion + " " + pluginVersion
CORE_POM_FILE=$1
PLUGIN_POM_FILE=$2
IOS_PLUGIN_POM_FILE=$3
PRODUCT_POM_FILE=$4
coreVersion=$5
pluginVersion=$6
PLUGIN_POM_FILE_CORE_VERSION=$7
IOS_PLUGIN_POM_FILE_CORE_VERSION=$8
IOS_PLUGIN_POM_FILE_PLUGIN_VERSION=$9
PRODUCT_POM_FILE_CORE_VERSION=${10}
PRODUCT_POM_FILE_PLUGIN_VERSION=${11}

TMP_POM="pom1.xml"
TMP_POM2="pom2.xml"

sed -i '' -e 's#\(<carbon.devicemgt.version>\)'$PLUGIN_POM_FILE_CORE_VERSION'\(</carbon.devicemgt.version>\)#\1'$coreVersion'\2#g' $PLUGIN_POM_FILE 

# xmlstarlet ed --pf -N p=http://maven.apache.org/POM/4.0.0 -u "/p:project/p:properties/p:carbon.devicemgt.version" -v $coreVersion $PLUGIN_POM_FILE > $TMP_POM
# mv $TMP_POM $PLUGIN_POM_FILE
echo "Updated plugin core version to "+coreVersion

sed -i '' -e 's#\(<carbon.device.mgt.version>\)'$IOS_PLUGIN_POM_FILE_CORE_VERSION'\(</carbon.device.mgt.version>\)#\1'$coreVersion'\2#g' $IOS_PLUGIN_POM_FILE
sed -i '' -e 's#\(<carbon.devicemgt.plugin.version>\)'$IOS_PLUGIN_POM_FILE_PLUGIN_VERSION'\(</carbon.devicemgt.plugin.version>\)#\1'$pluginVersion'\2#g' $IOS_PLUGIN_POM_FILE
# xmlstarlet ed --pf -N p=http://maven.apache.org/POM/4.0.0 -u "/p:project/p:properties/p:carbon.device.mgt.version" -v $coreVersion $IOS_PLUGIN_POM_FILE > $TMP_POM
# xmlstarlet ed --pf -N p=http://maven.apache.org/POM/4.0.0 -u "/p:project/p:properties/p:carbon.devicemgt.plugin.version" -v $pluginVersion $TMP_POM > $TMP_POM2
# mv $TMP_POM2 $IOS_PLUGIN_POM_FILE
# rm $TMP_POM
# echo "Updated iOS plugin's core version to "+coreVersion
# echo "Updated iOS plugin's plugin version to "+coreVersion


sed -i '' -e 's#\(<carbon.device.mgt.version>\)'$PRODUCT_POM_FILE_CORE_VERSION'\(</carbon.device.mgt.version>\)#\1'$coreVersion'\2#g' $PRODUCT_POM_FILE
sed -i '' -e 's#\(<carbon.device.mgt.plugin.version>\)'$PRODUCT_POM_FILE_PLUGIN_VERSION'\(</carbon.device.mgt.plugin.version>\)#\1'$pluginVersion'\2#g' $PRODUCT_POM_FILE
# xmlstarlet ed --pf -N p=http://maven.apache.org/POM/4.0.0 -u "/p:project/p:properties/p:carbon.device.mgt.version" -v $coreVersion $PRODUCT_POM_FILE > $TMP_POM
# xmlstarlet ed --pf -N p=http://maven.apache.org/POM/4.0.0 -u "/p:project/p:properties/p:carbon.device.mgt.plugin.version" -v $pluginVersion $TMP_POM > $TMP_POM2
# mv $TMP_POM2 $PRODUCT_POM_FILE
# rm $TMP_POM
# echo "Updated product's core version to "+coreVersion
# echo "Updated product's plugin version to "+coreVersion
