import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        // Cartão: Casos Suspeitos
        Rectangle {
            Layout.fillWidth: true
            height: 80
            radius: 10
            color: "#FAD089" // Laranja claro
            Text {
                text: "Casos suspeitos: 12"
                font.bold: true
                font.pixelSize: 20
                anchors.centerIn: parent
                color: "#D97B29"
            }
        }

        // Cartão: Casos Confirmados
        Rectangle {
            Layout.fillWidth: true
            height: 80
            radius: 10
            color: "#B4D998" // Verde claro
            Text {
                text: "Casos confirmados: 4"
                font.bold: true
                font.pixelSize: 20
                anchors.centerIn: parent
                color: "#6B994D"
            }
        }

        // Cartão: Prazos Vencendo
        Rectangle {
            Layout.fillWidth: true
            height: 80
            radius: 10
            color: "#F29B9B" // Vermelho claro
            Text {
                text: "Prazos vencendo: 1"
                font.bold: true
                font.pixelSize: 20
                anchors.centerIn: parent
                color: "#C42D2D"
            }
        }

        // Placeholder para o Mapa
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true // Ocupa o resto do espaço
            radius: 10
            color: "#E0E0E0"
            border.color: "#BDBDBD"
            
            Text {
                text: "[ Componente de Mapa Aqui ]"
                anchors.centerIn: parent
                color: "gray"
            }
        }
    }
}