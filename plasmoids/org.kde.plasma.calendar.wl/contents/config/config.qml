import QtQuick 2.2
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
         name: i18n("Appearance icon")
         icon: 'preferences-desktop-color'
         source: 'config/ConfigAppearance.qml'
    }
}
