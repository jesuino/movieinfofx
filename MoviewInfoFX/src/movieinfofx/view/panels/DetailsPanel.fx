/*
 * DetailsPanel.fx
 *
 * Created on 31/01/2010, 21:55:33
 */
package movieinfofx.view.panels;

import javafx.scene.*;
import javafx.scene.layout.*;
import javafx.scene.image.*;
import javafx.scene.effect.*;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.control.Hyperlink;
import javafx.stage.AppletStageExtension;
import javafx.scene.*;
import movieinfofx.ivaapi.model.IVAObject;
import javafx.scene.text.*;
import org.jfxtras.scene.control.XPane;
import org.jfxtras.scene.layout.XLayoutInfo;
import javafx.scene.control.TextBox;

/**
 * @author william
 */
public abstract class DetailsPanel extends CustomNode {

    /*
    The strings to show
     */
    public var object: IVAObject on replace {
                object.loadImage()
            };
    public var main: Container;
    public var width: Number = 700;
    public var imgWidth = 150;
    public var imgHeight = 200;
    public var titleEffect: Effect = DropShadow {
                offsetX: 10 offsetY: 10
                color: Color.GRAY
                radius: 5
            }
    public var panelStyle: String = "";   

    override function create(): Node {
        configValues();
        var lblTitle = Text {
                    style: "font-weight: bold;font-size: 28pt; fill: red";
                    content: bind object.title;
                    textAlignment: TextAlignment.CENTER;
                    translateX: 10;
                }
        var lblDesc = Text {
                    layoutInfo: XLayoutInfo {maxWidth: width}
                    wrappingWidth: width;
                    style: "font-size: 15pt;";
                    content: bind object.description
                    font: Font {name: "Italic"}
                    translateX: 10;
                }
        var imgView: Node =
                ImageView {
                    image: bind object.img
                    fitHeight: imgHeight;
                    fitWidth: imgWidth;
                }
        var otherInfo = VBox {spacing: 5;}
        var body = XPane {
                    style: bind panelStyle;
                    title: "More Info";
                    width: bind main.width;
                    contentNode: HBox {spacing: 5; content: [imgView, otherInfo]}
                }
        main = VBox {
            width: width; spacing: 20;
            content: [
                lblTitle, lblDesc, body
            ]
        }
        insert OtherInfoPanel {info: "Genre", value: bind object.genre} into otherInfo.content;
        insert OtherInfoPanel {info: "Date Created", value: bind object.dateCreated} into otherInfo.content;
        insert OtherInfoPanel {info: "Language", value: bind object.language} into otherInfo.content;
        insert OtherInfoPanel {info: "Country", value: bind object.country} into otherInfo.content;
        insert moreDetails() into otherInfo.content;
        insert HBox {
            spacing: 10;
            content: [
                Hyperlink {
                    text: "See video";
                    action: function () {
                        AppletStageExtension.showDocument(object.webUrl);
                    }
                }
                TextBox {style: "height: 30; width: 100; font-weight: bold;font-size: 10pt;" editable: false text: bind object.webUrl}
            ]
        } into otherInfo.content;
        main
    }

    public abstract function moreDetails(): Node[];

    public abstract function configValues(): Void;
}
