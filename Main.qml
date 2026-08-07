import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 480
    height: 800
    visible: true
    title: "LeptoGeo"

    color: "#F5F7FA"

    // 1. HEADER
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

        Text {
            text: "➜"
            color: "white"
            font.pixelSize: 24
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // 2. BARRA DE ABAS
    TabBar {
        id: navBar
        width: parent.width
        z: 2

        TabButton {
            text: "Dashboard"
            background: Rectangle { color: navBar.currentIndex === 0 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter; font.bold: navBar.currentIndex === 0 }
        }
        TabButton {
            text: "Notificar"
            background: Rectangle { color: navBar.currentIndex === 1 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter; font.bold: navBar.currentIndex === 1 }
        }
        TabButton {
            text: "Prazos"
            background: Rectangle { color: navBar.currentIndex === 2 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter; font.bold: navBar.currentIndex === 2 }
        }
        TabButton {
            text: "Relatórios"
            background: Rectangle { color: navBar.currentIndex === 3 ? "#6C82C9" : "#8DA3E6" }
            contentItem: Text { text: parent.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter; font.bold: navBar.currentIndex === 3 }
        }
    }

    // 3. GERENCIADOR DE TELAS (ABAS)
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
                anchors.fill: parent; spacing: 15; padding: 15

                Rectangle {
                    width: parent.width - 30; height: 90; radius: 15; color: "#FCD08F"
                    Row { anchors.centerIn: parent; spacing: 15
                        Text { text: "👥❓"; font.pixelSize: 40 }
                        Text { text: "Casos suspeitos: 12"; color: "#B87A3D"; font.pixelSize: 22; font.bold: true; anchors.verticalCenter: parent.verticalCenter }
                    }
                }
                Rectangle {
                    width: parent.width - 30; height: 90; radius: 15; color: "#B3E297"
                    Row { anchors.centerIn: parent; spacing: 15
                        Text { text: "👥✔"; font.pixelSize: 40 }
                        Text { text: "Casos confirmados: 4"; color: "#6A994E"; font.pixelSize: 22; font.bold: true; anchors.verticalCenter: parent.verticalCenter }
                    }
                }
                Rectangle {
                    width: parent.width - 30; height: 90; radius: 15; color: "#F79B9B"
                    Row { anchors.centerIn: parent; spacing: 15
                        Text { text: "⏰❗"; font.pixelSize: 40 }
                        Text { text: "Prazos vencendo: 1"; color: "#BC4749"; font.pixelSize: 22; font.bold: true; anchors.verticalCenter: parent.verticalCenter }
                    }
                }
                Rectangle {
                    width: parent.width - 30; height: 250; radius: 15; color: "#E2E8F0"; border.color: "#CBD5E1"; border.width: 2
                    Text { text: "🗺️\nÁrea do Mapa\n(Estático)"; anchors.centerIn: parent; horizontalAlignment: Text.AlignHCenter; color: "#94A3B8"; font.pixelSize: 18; font.bold: true }
                }
            }
        }

        // ==========================================
        // TELA 2: NOTIFICAR
        // ==========================================
        Item {
            ScrollView {
                anchors.fill: parent
                Column {
                    width: parent.width; spacing: 15; padding: 20

                    Text { text: "1. Dados do paciente"; color: "#6C82C9"; font.pixelSize: 20; font.bold: true }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Nome completo"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Cartão SUS"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Data Nascimento"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }

                    Item { width: 1; height: 10 }

                    Text { text: "2. Local provável de infecção (LPI)"; color: "#6C82C9"; font.pixelSize: 20; font.bold: true }
                    TextField { width: (parent.width - 40) * 0.4; height: 50; placeholderText: "CEP"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }
                    TextField { width: parent.width - 40; height: 50; placeholderText: "Rua"; background: Rectangle { color: "#DDE4F0"; radius: 8 } }

                    Item { width: 1; height: 20 }

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

        // ==========================================
        // TELA 3: PRAZOS (NOVO MODELO TABELA)
        // ==========================================
        Item {
            Column {
                anchors.fill: parent; spacing: 10; padding: 10

                Text {
                    text: "ACOMPANHAMENTO DE CASOS\n(Limite: 60 dias)"
                    color: "#6C82C9"
                    font.pixelSize: 18
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width
                    bottomPadding: 10
                }

                // CABEÇALHO DA TABELA
                Row {
                    width: parent.width; spacing: 5
                    padding: 5
                    Text { width: 95; text: "PACIENTE"; font.bold: true; font.pixelSize: 12; color: "#64748B" }
                    Text { width: 70; text: "DATA"; font.bold: true; font.pixelSize: 12; color: "#64748B" }
                    Text { width: 65; text: "DIAS"; font.bold: true; font.pixelSize: 12; color: "#64748B" }
                    Text { width: 140; text: "STATUS LAB."; font.bold: true; font.pixelSize: 12; color: "#64748B" }
                    Text { width: 45; text: "AÇÃO"; font.bold: true; font.pixelSize: 12; color: "#64748B"; horizontalAlignment: Text.AlignHCenter }
                }

                // LINHA 1 (Amarela - Alerta)
                Rectangle {
                    width: parent.width; height: 55; radius: 8; color: "#FCD08F"
                    Row {
                        anchors.fill: parent; anchors.margins: 5; spacing: 5
                        Text { width: 95; text: "João M."; font.pixelSize: 14; font.bold: true; anchors.verticalCenter: parent.verticalCenter; wrapMode: Text.WordWrap }
                        Text { width: 70; text: "10/05"; font.pixelSize: 14; anchors.verticalCenter: parent.verticalCenter }
                        Text { width: 65; text: "06 Dias"; font.pixelSize: 14; font.bold: true; color: "#9E2A2B"; anchors.verticalCenter: parent.verticalCenter }
                        Text { width: 140; text: "Aguardando Elisa"; font.pixelSize: 13; anchors.verticalCenter: parent.verticalCenter; wrapMode: Text.WordWrap }

                        Button {
                            width: 45; height: 35; anchors.verticalCenter: parent.verticalCenter
                            background: Rectangle { color: "#6C82C9"; radius: 5 }
                            contentItem: Text { text: ">>"; color: "white"; font.bold: true; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                        }
                    }
                }

                // LINHA 2 (Vermelha - Urgente)
                Rectangle {
                    width: parent.width; height: 55; radius: 8; color: "#F79B9B"
                    Row {
                        anchors.fill: parent; anchors.margins: 5; spacing: 5
                        Text { width: 95; text: "Maria S."; font.pixelSize: 14; font.bold: true; anchors.verticalCenter: parent.verticalCenter; wrapMode: Text.WordWrap }
                        Text { width: 70; text: "02/04"; font.pixelSize: 14; anchors.verticalCenter: parent.verticalCenter }
                        Text { width: 65; text: "Atrasado"; font.pixelSize: 14; font.bold: true; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                        Text { width: 140; text: "Coleta pendente"; font.pixelSize: 13; anchors.verticalCenter: parent.verticalCenter; wrapMode: Text.WordWrap }

                        Button {
                            width: 45; height: 35; anchors.verticalCenter: parent.verticalCenter
                            background: Rectangle { color: "#9E2A2B"; radius: 5 }
                            contentItem: Text { text: ">>"; color: "white"; font.bold: true; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                        }
                    }
                }

                // LINHA 3 (Verde - No prazo)
                Rectangle {
                    width: parent.width; height: 55; radius: 8; color: "#B3E297"
                    Row {
                        anchors.fill: parent; anchors.margins: 5; spacing: 5
                        Text { width: 95; text: "Carlos R."; font.pixelSize: 14; font.bold: true; anchors.verticalCenter: parent.verticalCenter; wrapMode: Text.WordWrap }
                        Text { width: 70; text: "25/06"; font.pixelSize: 14; anchors.verticalCenter: parent.verticalCenter }
                        Text { width: 65; text: "45 Dias"; font.pixelSize: 14; font.bold: true; color: "#386641"; anchors.verticalCenter: parent.verticalCenter }
                        Text { width: 140; text: "Amostra enviada"; font.pixelSize: 13; anchors.verticalCenter: parent.verticalCenter; wrapMode: Text.WordWrap }

                        Button {
                            width: 45; height: 35; anchors.verticalCenter: parent.verticalCenter
                            background: Rectangle { color: "#6C82C9"; radius: 5 }
                            contentItem: Text { text: ">>"; color: "white"; font.bold: true; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                        }
                    }
                }
            }
        }

        // ==========================================
        // TELA 4: RELATÓRIOS (USANDO STACKVIEW PARA NAVEGAÇÃO)
        // ==========================================
        StackView {
            id: relatoriosStack

            // TELA INICIAL (Lista de Pacientes)
            initialItem: Item {
                Column {
                    width: parent.width; spacing: 15; padding: 20

                    Text { text: "Selecione um Paciente"; color: "#6C82C9"; font.pixelSize: 20; font.bold: true; bottomPadding: 10 }

                    // Paciente 1
                    Rectangle {
                        width: parent.width - 40; height: 70; radius: 8; color: "white"; border.color: "#CBD5E1"; border.width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 15
                            Text { text: "João M. (Confirmado)"; font.pixelSize: 16; font.bold: true; color: "#334155"; Layout.fillWidth: true }
                            Button {
                                text: "Ver Relatório"
                                background: Rectangle { color: "#6C82C9"; radius: 5 }
                                contentItem: Text { text: parent.text; color: "white"; font.bold: true }
                                // A MÁGICA ACONTECE AQUI: O botão "empurra" a tela de detalhes
                                onClicked: relatoriosStack.push(telaDetalhesRelatorio)
                            }
                        }
                    }

                    // Paciente 2
                    Rectangle {
                        width: parent.width - 40; height: 70; radius: 8; color: "white"; border.color: "#CBD5E1"; border.width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 15
                            Text { text: "Maria S. (Suspeito)"; font.pixelSize: 16; font.bold: true; color: "#334155"; Layout.fillWidth: true }
                            Button {
                                text: "Ver Relatório"
                                background: Rectangle { color: "#6C82C9"; radius: 5 }
                                contentItem: Text { text: parent.text; color: "white"; font.bold: true }
                                onClicked: relatoriosStack.push(telaDetalhesRelatorio)
                            }
                        }
                    }
                }
            }

            // TELA SECUNDÁRIA (Detalhes do Relatório)
            Component {
                id: telaDetalhesRelatorio
                Item {
                    ScrollView {
                        anchors.fill: parent
                        Column {
                            width: parent.width; spacing: 15; padding: 20

                            // Botão VOLTAR (Desempilha a tela)
                            Button {
                                text: "⬅ Voltar para a lista"
                                background: Rectangle { color: "transparent" }
                                contentItem: Text { text: parent.text; color: "#6C82C9"; font.bold: true; font.pixelSize: 16 }
                                onClicked: relatoriosStack.pop()
                            }

                            Text { text: "Visão Geral do Paciente"; color: "#6C82C9"; font.pixelSize: 20; font.bold: true; topPadding: 10 }

                            Rectangle {
                                width: parent.width - 40; height: 160; radius: 12; color: "white"; border.color: "#CBD5E1"; border.width: 1
                                anchors.horizontalCenter: parent.horizontalCenter
                                Column {
                                    anchors.centerIn: parent; spacing: 10
                                    Text { text: "📊"; font.pixelSize: 40; anchors.horizontalCenter: parent.horizontalCenter }
                                    Text { text: "Gráfico do Paciente\n(Em desenvolvimento)"; color: "#94A3B8"; horizontalAlignment: Text.AlignHCenter; anchors.horizontalCenter: parent.horizontalCenter }
                                }
                            }

                            Text { text: "Observações do Relatório"; color: "#6C82C9"; font.pixelSize: 18; font.bold: true }

                            TextArea {
                                width: parent.width - 40; height: 90; placeholderText: "Escreva aqui notas ou observações..."
                                wrapMode: Text.WordWrap; anchors.horizontalCenter: parent.horizontalCenter
                                background: Rectangle { color: "#DDE4F0"; radius: 8 }
                            }

                            Text { text: "Exportar Dados"; color: "#6C82C9"; font.pixelSize: 18; font.bold: true }

                            Button {
                                width: parent.width - 40; height: 55; anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text { text: "📄 GERAR PDF DO PACIENTE"; color: "white"; font.bold: true; font.pixelSize: 14; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                                background: Rectangle { color: "#8DA3E6"; radius: 10 }
                            }

                            Button {
                                width: parent.width - 40; height: 55; anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text { text: "📈 EXPORTAR DADOS (.CSV)"; color: "white"; font.bold: true; font.pixelSize: 14; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                                background: Rectangle { color: "#6C82C9"; radius: 10 }
                            }
                        }
                    }
                }
            }
        }
    }
}
