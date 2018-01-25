#!/usr/bin/python
#!/bin/sh
CORE_POM_FILE="../carbon-device-mgt/pom.xml"
PLUGIN_POM_FILE="../carbon-device-mgt-plugins/pom.xml"
IOS_PLUGIN_POM_FILE="../carbon-devicemgt-proprietary-plugins_copy/pom.xml"
PRODUCT_POM_FILE="../product-iots/pom.xml"

from xml.etree import ElementTree
import subprocess
from subprocess import call

namespaces = {'xmlns' : 'http://maven.apache.org/POM/4.0.0'}

tree = ElementTree.parse(CORE_POM_FILE)
root = tree.getroot()

version = root.find(".//xmlns:version", namespaces=namespaces)
coreVersion = version.text
print "Core version: " + coreVersion

tree = ElementTree.parse(PLUGIN_POM_FILE)
root = tree.getroot()
version = root.find(".//xmlns:version", namespaces=namespaces)
pluginVersion = version.text
version = root.find(".//xmlns:properties/xmlns:carbon.devicemgt.version", namespaces=namespaces)
oldCoreVersion = version.text
print oldCoreVersion+"Plugin version: " + pluginVersion

tree = ElementTree.parse(IOS_PLUGIN_POM_FILE)
root = tree.getroot()
version = root.find(".//xmlns:properties/xmlns:carbon.device.mgt.version", namespaces=namespaces)
iosOldCoreVersion = version.text
version = root.find(".//xmlns:properties/xmlns:carbon.devicemgt.plugin.version", namespaces=namespaces)
iosOldPluginVersion = version.text

tree = ElementTree.parse(PRODUCT_POM_FILE)
root = tree.getroot()
version = root.find(".//xmlns:properties/xmlns:carbon.device.mgt.version", namespaces=namespaces)
productOldCoreVersion = version.text
version = root.find(".//xmlns:properties/xmlns:carbon.device.mgt.plugin.version", namespaces=namespaces)
productOldPluginVersion = version.text


changer = "./changer.sh " + CORE_POM_FILE + " " + PLUGIN_POM_FILE + " " + IOS_PLUGIN_POM_FILE + " " + PRODUCT_POM_FILE + " " + coreVersion + " " + pluginVersion + " " + oldCoreVersion + " "+iosOldCoreVersion + " " + iosOldPluginVersion + " "+productOldCoreVersion+" "+ productOldPluginVersion
# print changer
rc = call(changer, shell=True)