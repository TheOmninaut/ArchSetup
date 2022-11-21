import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

MouseArea {
	id: sidebarMenu
	hoverEnabled: true
	z: 1
	// clip: true
	implicitWidth: config.sidebarWidth
	property bool open: false

	onOpenChanged: {
		if (open) {
			forceActiveFocus()
		} else {
			searchView.searchField.forceActiveFocus()
		}
	}

	Rectangle {
		anchors.fill: parent
		visible: !plasmoid.configuration.sidebarFollowsTheme
		color: config.sidebarBackgroundColor
		opacity: parent.open ? 1 : 0
	}

	Rectangle {
		anchors.fill: parent
		visible: plasmoid.configuration.sidebarFollowsTheme
		color: PlasmaCore.Theme.backgroundColor
		opacity: parent.open ? 1 : 0
	}
	PlasmaCore.FrameSvgItem {
		anchors.fill: parent
		visible: plasmoid.configuration.sidebarFollowsTheme
		imagePath: "widgets/frame"
		prefix: "raised"
	}

	property alias showDropShadow: sidebarMenuShadows.visible
	SidebarMenuShadows {
		id: sidebarMenuShadows
		anchors.fill: parent
		visible: !plasmoid.configuration.sidebarFollowsTheme && sidebarMenu.open
	}
}
