/*
 * OtherPanel.fx
 *
 * Created on 02/02/2010, 19:09:46
 */
package movieinfofx.view.panels;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.*;
import javafx.scene.text.*;

/**
 * @author william
 */
public class OtherInfoPanel extends CustomNode {

    public var info: String;
    public var value: String;

    override protected function create(): Node {
        Flow {
            vertical: false;
            content: [
                Text {
                    content: bind "{info}: ";
                    style: "font-weight: bold";
                    wrappingWidth: 120;
                    textAlignment: TextAlignment.CENTER
                }
                Text {
                    content: bind value;
                    layoutX: 100 wrappingWidth: 180
                    textAlignment: TextAlignment.CENTER
                }
            ]
        }
    }
}
