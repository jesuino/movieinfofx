/*
 * Welcome.fx
 *
 * Created on 08/02/2010, 16:30:07
 */
package movieinfofx.view;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import org.jfxtras.scene.control.XPane;
import javafx.scene.paint.Color;

/**
 * @author william
 */
public class Welcome extends CustomNode {

    var title: String = "Movie Explorer FX";
    var description: String =
            "This is a preview of a platform to explore the IVA API.\n""In this first release, we will show a little of video, game, music searches using the IVA API.\n\n"
                    "This is a little buggy preview ;-), in a future release  we pretend:\n"
                    "- Add ability to mix contents( we are already working with Twitter, Google Translator, bit.ly and others)\n"
                    "- Kill all bugs - There's a lot =D\n"
                    "- I18N\n"
                    "- Improve performance\n"
                    "- Improve Design\n\n"
                    "We are using JFXtras(jfxtras.org) and IVA API(api.internetvideoarchive.com)\n\n"
                    "Let now your suggestions:\n"
                    "My Email: william.fatecsjc@gmail.com\n"
                    "My Twitter: @william_antonio\n"
                    "Good luck with this preview :-D   8-D";

    override protected function create(): Node {
        XPane {
             title: "About this application";
            contentNode: VBox {
                    spacing:50;
                content: [
                    Text {
                        fill: Color.RED;
                        content: title;
                        style: "font-weight: bold; font-size: 30pt; "
                    }
                    Text { style: "font-size: 15pt;"content: description }
                ]
            } }
    }

}
