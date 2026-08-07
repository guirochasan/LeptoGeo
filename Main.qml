import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 480
    height: 800
    visible: true
    title: "LeptoGeo"

    // 1. HEADER (Barra Superior Azul)
    header: Rectangle {
        width: parent.width
        height: 60
        color: "#8DA3E6"

        Text {
            text: "LeptoGeo"
            color: "white"
            font.pixelSize: 20
            font.bold: true
            anchors.centerIn: parent
        }

        // Ícone de Saída (Usando um caractere para simular)
        Text {
            text: "➜"
            color: "white"
            font.pixelSize: 24
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // 2. BARRA DE ABAS (Navegação)
    TabBar {
        id: navBar
        width: parent.width
        z: 2

        TabButton {
            text: "Dashboard"
            background: Rectangle { color: navBar.currentIndex === 0 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
        }
        TabButton {
            text: "Notificar"
            background: Rectangle { color: navBar.currentIndex === 1 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
        }
        TabButton {
            text: "Prazos"
            background: Rectangle { color: navBar.currentIndex === 2 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
        }
        TabButton {
            text: "Relatórios"
            background: Rectangle { color: navBar.currentIndex === 3 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
        }
    }

    // 3. GERENCIADOR DE TELAS
    StackLayout {
        anchors.top: navBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        currentIndex: navBar.currentIndex

        // ==========================================
        // TELA 1: DASHBOARD
        // ==========================================
        Item {
            Column {
                anchors.fill: parent
                spacing: 15
                padding: 15

                // Card Amarelo
                Rectangle {
                    width: parent.width - 30; height: 90; radius: 15; color: "#FCD08F"
                    Row {
                        anchors.centerIn: parent; spacing: 15
                        Text { text: "👥❓"; font.pixelSize: 40 }
                        Text { text: "Casos suspeitos: 12"; color: "#B87A3D"; font.pixelSize: 22; font.bold: true; anchors.verticalCenter: parent.verticalCenter }
                    }
                }

                // Card Verde
                Rectangle {
                    width: parent.width - 30; height: 90; radius: 15; color: "#B3E297"
                    Row {
                        anchors.centerIn: parent; spacing: 15
                        Text { text: "👥✔"; font.pixelSize: 40 }
                        Text { text: "Casos confirmados: 4"; color: "#6A994E"; font.pixelSize: 22; font.bold: true; anchors.verticalCenter: parent.verticalCenter }
                    }
                }

                // Card Vermelho
                Rectangle {
                    width: parent.width - 30; height: 90; radius: 15; color: "#F79B9B"
                    Row {
                        anchors.centerIn: parent; spacing: 15
                        Text { text: "⏰❗"; font.pixelSize: 40 }
                        Text { text: "Prazos vencendo: 1"; color: "#BC4749"; font.pixelSize: 22; font.bold: true; anchors.verticalCenter: parent.verticalCenter }
                    }
                }

                // Substituto do Mapa (Imagem Estática ou Retângulo)
                Rectangle {
                    width: parent.width - 30
                    height: 250
                    radius: 15
                    color: "#E2E8F0"
                    border.color: "#CBD5E1"
                    border.width: 2

                    // Se você tiver um print do mapa salvo na pasta do projeto,
                    // apague o Text abaixo e descomente a linha do Image:
                    // Image { anchors.fill: parent; source: "mapa_print.jpg"; fillMode: Image.PreserveAspectCrop }

                    Text {
                        text: "🗺️\nÁrea do Mapa\n(Estático)"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        color: "#94A3B8"
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
            }
        }

        // ==========================================
        // TELA 2: NOTIFICAR (Formulário)
        // ==========================================
        Item {
            ScrollView {
                anchors.fill: parent
                Column {
                    width: parent.width
                    spacing: 15
                    padding: 20

                    Text { text: "1. Dados do paciente"; color: "#6C82C9"; font.pixelSize: 20; font.bold: true }

                    TextField { width: parent.width - 40; height: 50; placeholderText: "Nome completo"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Cartão SUS"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Data Nascimento"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }

                    Item { width: 1; height: 10 } // Espaçador

                    Text { text: "2. Local provável de infecção (LPI)"; color: "#6C82C9"; font.pixelSize: 20; font.bold: true }

                    TextField { width: (parent.width - 40) * 0.4; height: 50; placeholderText: "CEP"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Rua"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }

                    Item { width: 1; height: 20 } // Espaçador

                    Button {
                        width: parent.width - 100; height: 55; anchors.horizontalCenter: parent.horizontalCenter
                        contentItem: Text { text: "SALVAR E ENVIAR"; color: "white"; font.bold: true; font.pixelSize: 16; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                        background: Rectangle { color: "#B3E297"; radius: 10 }
                    }

                    Button {
                        width: parent.width - 100; height: 55; anchors.horizontalCenter: parent.horizontalCenter
                        contentItem: Text { text: "CANCELAR"; color: "white"; font.bold: true; font.pixelSize: 16; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                        background: Rectangle { color: "#F79B9B"; radius: 10 }
                    }
                }
            }
        }

        // TELA 3 (Prazos - Vazia por enquanto)
        Item { Text { text: "Tela de Prazos em construção..."; anchors.centerIn: parent } }

        // TELA 4 (Relatórios - Vazia por enquanto)
        Item { Text { text: "Tela de Relatórios em construção..."; anchors.centerIn: parent } }
    }
}