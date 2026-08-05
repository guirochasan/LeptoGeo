import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "LeptoGeo"

    // CABEÇALHO COMPARTILHADO
    header: ColumnLayout {
        spacing: 0
        
        // Barra Azul Superior
        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: "#8DA5DF" // Cor baseada nas suas imagens
            
            Text {
                text: "LeptoGeo"
                color: "white"
                font.pixelSize: 18
                anchors.centerIn: parent
            }
            
            // Ícone/Botão de Sair simulado
            Button {
                text: "→"
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                flat: true
            }
        }

        // Barra de Navegação (Tabs)
        TabBar {
            id: bar
            Layout.fillWidth: true
            background: Rectangle { color: "#6C84C4" }
            
            TabButton { text: "Dashboard" }
            TabButton { text: "Notificar" }
            TabButton { text: "Prazos" }
            TabButton { text: "Relatórios" }
        }
    }

    // CONTROLADOR DE TELAS
    StackLayout {
        anchors.fill: parent
        currentIndex: bar.currentIndex

        DashboardPage {} // Índice 0 (tela1.jpg)
        NotificarPage {} // Índice 1 (tela2.png)
        Item {}          // Índice 2 (Prazos - Vazio por enquanto)
        Item {}          // Índice 3 (Relatórios - Vazio por enquanto)
    }
}