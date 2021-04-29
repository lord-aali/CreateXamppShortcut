echo "Create xampp control panel shortcut by lord.aali."

if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi



policyFileName='/usr/share/polkit-1/actions/org.freedesktop.policykit.xampp.policy'

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE policyconfig PUBLIC \"-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN\" \"http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd\">
<policyconfig>
    <vendor>Apache Friends</vendor>
    <vendor_url>https://www.apachefriends.org/index.html</vendor_url>
	<icon_name>xampp</icon_name>

	<action id=\"com.ubuntu.pkexec.xampp.policy\">
        <description>Run XAMPP Control Panel</description>
		<message>Authentication is required to run the XAMP Control Panel</message>
		<defaults>
			<allow_any>auth_admin</allow_any>
			<allow_inactive>auth_admin</allow_inactive>
			<allow_active>auth_admin</allow_active>
		</defaults>
		<annotate key=\"org.freedesktop.policykit.exec.path\">/opt/lampp/manager-linux-x64.run</annotate>
		<annotate key=\"org.freedesktop.policykit.exec.allow_gui\">true</annotate>
	</action>
</policyconfig>
" > $policyFileName


shortcutFileName='/usr/share/applications/xampp-control-panel.desktop'

echo "[Desktop Entry]
Version=1.1
Type=Application
Name=XAMPP
Comment=Run XAMPP Control Panel.
Icon=/opt/lampp/htdocs/favicon.ico
Exec=pkexec /opt/lampp/manager-linux-x64.run
Actions=
Categories=Network;" > $shortcutFileName


echo "Done"

